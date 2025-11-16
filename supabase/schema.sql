-- =====================================================
-- Supabase Schema for Hải Phòng Administrative Lookup
-- =====================================================

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop table if exists (for re-creation)
DROP TABLE IF EXISTS locations CASCADE;

-- Create locations table
CREATE TABLE locations (
    -- Primary key
    id TEXT PRIMARY KEY,

    -- Basic information
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    district TEXT NOT NULL,

    -- Contact details
    address TEXT NOT NULL,
    phone TEXT NOT NULL,
    working_hours TEXT NOT NULL,

    -- GPS coordinates
    latitude DECIMAL(10, 7) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,

    -- Services (stored as JSONB array)
    services JSONB NOT NULL DEFAULT '[]'::jsonb,

    -- Additional info
    notes TEXT DEFAULT '',

    -- Metadata
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    -- Search optimization
    search_vector TSVECTOR
);

-- Create indexes for better performance
CREATE INDEX idx_locations_category ON locations(category);
CREATE INDEX idx_locations_district ON locations(district);
CREATE INDEX idx_locations_name ON locations(name);
CREATE INDEX idx_locations_coordinates ON locations(latitude, longitude);

-- Create full-text search index
CREATE INDEX idx_locations_search ON locations USING GIN(search_vector);

-- Create function to update search_vector automatically
CREATE OR REPLACE FUNCTION locations_search_vector_update()
RETURNS TRIGGER AS $$
BEGIN
    NEW.search_vector :=
        setweight(to_tsvector('simple', COALESCE(NEW.name, '')), 'A') ||
        setweight(to_tsvector('simple', COALESCE(NEW.address, '')), 'B') ||
        setweight(to_tsvector('simple', COALESCE(NEW.district, '')), 'B') ||
        setweight(to_tsvector('simple', COALESCE(NEW.category, '')), 'C');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to update search_vector on insert/update
CREATE TRIGGER locations_search_vector_trigger
    BEFORE INSERT OR UPDATE ON locations
    FOR EACH ROW
    EXECUTE FUNCTION locations_search_vector_update();

-- Create function to update updated_at automatically
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to update updated_at
CREATE TRIGGER locations_updated_at_trigger
    BEFORE UPDATE ON locations
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security (RLS)
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;

-- Create policy: Allow public to read all locations
CREATE POLICY "Allow public read access"
    ON locations
    FOR SELECT
    TO public
    USING (true);

-- Create policy: Allow authenticated users to insert (optional)
CREATE POLICY "Allow authenticated insert"
    ON locations
    FOR INSERT
    TO authenticated
    WITH CHECK (true);

-- Create policy: Allow authenticated users to update (optional)
CREATE POLICY "Allow authenticated update"
    ON locations
    FOR UPDATE
    TO authenticated
    USING (true);

-- Create policy: Allow authenticated users to delete (optional)
CREATE POLICY "Allow authenticated delete"
    ON locations
    FOR DELETE
    TO authenticated
    USING (true);

-- Comments for documentation
COMMENT ON TABLE locations IS 'Stores administrative office locations in Hải Phòng';
COMMENT ON COLUMN locations.id IS 'Unique identifier for the location';
COMMENT ON COLUMN locations.name IS 'Official name of the office';
COMMENT ON COLUMN locations.category IS 'Category: Quận/Huyện, Sở ngành, etc.';
COMMENT ON COLUMN locations.district IS 'District/County name';
COMMENT ON COLUMN locations.address IS 'Full address';
COMMENT ON COLUMN locations.phone IS 'Contact phone number';
COMMENT ON COLUMN locations.working_hours IS 'Working hours description';
COMMENT ON COLUMN locations.latitude IS 'GPS latitude coordinate';
COMMENT ON COLUMN locations.longitude IS 'GPS longitude coordinate';
COMMENT ON COLUMN locations.services IS 'Array of services provided (JSONB)';
COMMENT ON COLUMN locations.notes IS 'Additional notes or remarks';
COMMENT ON COLUMN locations.search_vector IS 'Full-text search vector (auto-generated)';
