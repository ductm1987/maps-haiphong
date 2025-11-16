/**
 * Hải Phòng Administrative Lookup Application
 * Tra cứu địa chỉ các cơ quan hành chính sau sát nhập
 */

// ===== State Management =====
const state = {
    allLocations: [],
    filteredLocations: [],
    currentView: 'list', // 'list' or 'grid'
    searchQuery: '',
    categoryFilter: '',
    districtFilter: ''
};

// ===== DOM Elements =====
const elements = {
    searchInput: document.getElementById('searchInput'),
    clearSearchBtn: document.getElementById('clearSearch'),
    categoryFilter: document.getElementById('categoryFilter'),
    districtFilter: document.getElementById('districtFilter'),
    resultsContainer: document.getElementById('resultsContainer'),
    resultsCount: document.getElementById('resultsCount'),
    resultsTitle: document.getElementById('resultsTitle'),
    loadingIndicator: document.getElementById('loadingIndicator'),
    noResults: document.getElementById('noResults'),
    listViewBtn: document.getElementById('listView'),
    gridViewBtn: document.getElementById('gridView'),
    modal: document.getElementById('detailModal'),
    modalTitle: document.getElementById('modalTitle'),
    modalBody: document.getElementById('modalBody'),
    closeModalBtn: document.getElementById('closeModal'),
    lastUpdated: document.getElementById('lastUpdated')
};

// ===== Initialize Application =====
async function init() {
    try {
        // Load data
        await loadData();

        // Setup event listeners
        setupEventListeners();

        // Populate district filter
        populateDistrictFilter();

        // Initial render
        filterAndRender();

        // Hide loading
        elements.loadingIndicator.style.display = 'none';
    } catch (error) {
        console.error('Error initializing app:', error);
        elements.loadingIndicator.innerHTML = `
            <p style="color: var(--danger-color);">
                ❌ Không thể tải dữ liệu. Vui lòng thử lại sau.
            </p>
        `;
    }
}

// ===== Load Data =====
async function loadData() {
    try {
        const response = await fetch('data/addresses.json');
        if (!response.ok) {
            throw new Error('Failed to fetch data');
        }
        const data = await response.json();
        state.allLocations = data.locations;

        // Update last updated date
        if (elements.lastUpdated && data.lastUpdated) {
            elements.lastUpdated.textContent = formatDate(data.lastUpdated);
        }
    } catch (error) {
        throw new Error('Error loading data: ' + error.message);
    }
}

// ===== Event Listeners Setup =====
function setupEventListeners() {
    // Search input
    elements.searchInput.addEventListener('input', handleSearch);

    // Clear search button
    elements.clearSearchBtn.addEventListener('click', clearSearch);

    // Filter selects
    elements.categoryFilter.addEventListener('change', handleCategoryFilter);
    elements.districtFilter.addEventListener('change', handleDistrictFilter);

    // View toggle buttons
    elements.listViewBtn.addEventListener('click', () => setView('list'));
    elements.gridViewBtn.addEventListener('click', () => setView('grid'));

    // Modal close
    elements.closeModalBtn.addEventListener('click', closeModal);
    elements.modal.addEventListener('click', (e) => {
        if (e.target === elements.modal) {
            closeModal();
        }
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && elements.modal.classList.contains('active')) {
            closeModal();
        }
    });
}

// ===== Search Handler =====
function handleSearch(e) {
    state.searchQuery = e.target.value.toLowerCase().trim();

    // Show/hide clear button
    elements.clearSearchBtn.style.display = state.searchQuery ? 'flex' : 'none';

    filterAndRender();
}

function clearSearch() {
    elements.searchInput.value = '';
    state.searchQuery = '';
    elements.clearSearchBtn.style.display = 'none';
    filterAndRender();
}

// ===== Filter Handlers =====
function handleCategoryFilter(e) {
    state.categoryFilter = e.target.value;
    filterAndRender();
}

function handleDistrictFilter(e) {
    state.districtFilter = e.target.value;
    filterAndRender();
}

function populateDistrictFilter() {
    const districts = [...new Set(state.allLocations.map(loc => loc.district))].sort();

    elements.districtFilter.innerHTML = '<option value="">Tất cả</option>';
    districts.forEach(district => {
        const option = document.createElement('option');
        option.value = district;
        option.textContent = district;
        elements.districtFilter.appendChild(option);
    });
}

// ===== Filter and Render =====
function filterAndRender() {
    // Apply filters
    state.filteredLocations = state.allLocations.filter(location => {
        // Search filter
        const searchMatch = !state.searchQuery ||
            location.name.toLowerCase().includes(state.searchQuery) ||
            location.address.toLowerCase().includes(state.searchQuery) ||
            location.district.toLowerCase().includes(state.searchQuery) ||
            location.services.some(service => service.toLowerCase().includes(state.searchQuery));

        // Category filter
        const categoryMatch = !state.categoryFilter || location.category === state.categoryFilter;

        // District filter
        const districtMatch = !state.districtFilter || location.district === state.districtFilter;

        return searchMatch && categoryMatch && districtMatch;
    });

    // Update results count and title
    elements.resultsCount.textContent = state.filteredLocations.length;

    let titleText = 'Tất cả cơ quan';
    if (state.categoryFilter) {
        titleText = state.categoryFilter;
    }
    if (state.districtFilter) {
        titleText += ` - ${state.districtFilter}`;
    }
    elements.resultsTitle.innerHTML = `${titleText} (<span id="resultsCount">${state.filteredLocations.length}</span>)`;

    // Render results
    renderResults();
}

// ===== Render Results =====
function renderResults() {
    elements.resultsContainer.innerHTML = '';

    if (state.filteredLocations.length === 0) {
        elements.noResults.style.display = 'block';
        elements.resultsContainer.style.display = 'none';
        return;
    }

    elements.noResults.style.display = 'none';
    elements.resultsContainer.style.display = 'grid';

    state.filteredLocations.forEach(location => {
        const card = createLocationCard(location);
        elements.resultsContainer.appendChild(card);
    });
}

// ===== Create Location Card =====
function createLocationCard(location) {
    const card = document.createElement('div');
    card.className = 'location-card';
    card.onclick = () => showDetails(location);

    card.innerHTML = `
        <div class="card-header">
            <div>
                <h3 class="card-title">${location.name}</h3>
                <span class="card-category">${location.category}</span>
            </div>
        </div>

        <div class="card-info">
            <div class="info-item">
                <span class="info-icon">📍</span>
                <span class="info-text">${location.address}</span>
            </div>

            <div class="info-item">
                <span class="info-icon">📞</span>
                <span class="info-text"><a href="tel:${location.phone}">${location.phone}</a></span>
            </div>

            <div class="info-item">
                <span class="info-icon">🕐</span>
                <span class="info-text">${location.workingHours}</span>
            </div>

            ${location.notes ? `
            <div class="info-item">
                <span class="info-icon">ℹ️</span>
                <span class="info-text"><em>${location.notes}</em></span>
            </div>
            ` : ''}
        </div>

        <div class="card-actions">
            <button class="btn btn-primary" onclick="event.stopPropagation(); openGoogleMaps(${location.latitude}, ${location.longitude}, '${escapeHtml(location.name)}')">
                🗺️ Chỉ đường
            </button>
            <button class="btn btn-secondary" onclick="event.stopPropagation(); showDetails(${JSON.stringify(location).replace(/"/g, '&quot;')})">
                📋 Chi tiết
            </button>
        </div>
    `;

    return card;
}

// ===== Show Details Modal =====
function showDetails(location) {
    if (typeof location === 'string') {
        location = JSON.parse(location.replace(/&quot;/g, '"'));
    }

    elements.modalTitle.textContent = location.name;
    elements.modalBody.innerHTML = `
        <div class="detail-section">
            <h3>📍 Thông tin liên hệ</h3>
            <div class="info-item mb-1">
                <span class="info-icon">🏢</span>
                <span class="info-text"><strong>Loại:</strong> ${location.category}</span>
            </div>
            <div class="info-item mb-1">
                <span class="info-icon">📍</span>
                <span class="info-text"><strong>Địa chỉ:</strong> ${location.address}</span>
            </div>
            <div class="info-item mb-1">
                <span class="info-icon">📞</span>
                <span class="info-text"><strong>Điện thoại:</strong> <a href="tel:${location.phone}">${location.phone}</a></span>
            </div>
            <div class="info-item mb-1">
                <span class="info-icon">🕐</span>
                <span class="info-text"><strong>Giờ làm việc:</strong> ${location.workingHours}</span>
            </div>
            ${location.notes ? `
            <div class="info-item mb-1">
                <span class="info-icon">ℹ️</span>
                <span class="info-text"><strong>Ghi chú:</strong> <em>${location.notes}</em></span>
            </div>
            ` : ''}
        </div>

        <div class="detail-section">
            <h3>🛠️ Dịch vụ cung cấp</h3>
            <ul class="detail-list">
                ${location.services.map(service => `<li>✓ ${service}</li>`).join('')}
            </ul>
        </div>

        <div class="detail-section">
            <h3>🗺️ Bản đồ và chỉ đường</h3>
            <div class="card-actions">
                <button class="btn btn-primary" onclick="openGoogleMaps(${location.latitude}, ${location.longitude}, '${escapeHtml(location.name)}')">
                    🚗 Chỉ đường từ vị trí của tôi
                </button>
                <button class="btn btn-secondary" onclick="openGoogleMapsView(${location.latitude}, ${location.longitude})">
                    👁️ Xem trên bản đồ
                </button>
            </div>
            <div class="map-container mt-2">
                <div id="map">
                    <iframe
                        width="100%"
                        height="300"
                        frameborder="0"
                        style="border:0"
                        src="https://www.google.com/maps?q=${location.latitude},${location.longitude}&output=embed"
                        allowfullscreen>
                    </iframe>
                </div>
            </div>
        </div>
    `;

    elements.modal.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeModal() {
    elements.modal.classList.remove('active');
    document.body.style.overflow = 'auto';
}

// ===== Google Maps Integration =====
function openGoogleMaps(lat, lng, name) {
    // Open Google Maps with directions from user's current location
    const url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&destination_place_id=${encodeURIComponent(name)}`;
    window.open(url, '_blank');
}

function openGoogleMapsView(lat, lng) {
    // Open Google Maps to view the location
    const url = `https://www.google.com/maps?q=${lat},${lng}`;
    window.open(url, '_blank');
}

// ===== View Toggle =====
function setView(viewType) {
    state.currentView = viewType;

    if (viewType === 'list') {
        elements.resultsContainer.classList.remove('grid-view');
        elements.resultsContainer.classList.add('list-view');
        elements.listViewBtn.classList.add('active');
        elements.gridViewBtn.classList.remove('active');
    } else {
        elements.resultsContainer.classList.remove('list-view');
        elements.resultsContainer.classList.add('grid-view');
        elements.gridViewBtn.classList.add('active');
        elements.listViewBtn.classList.remove('active');
    }
}

// ===== Utility Functions =====
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
}

// ===== Remove URL parameters (for clean URLs) =====
function removeQueryParams() {
    if (window.location.search) {
        window.history.replaceState({}, document.title, window.location.pathname);
    }
}

// ===== Start Application =====
document.addEventListener('DOMContentLoaded', () => {
    removeQueryParams();
    init();
});

// ===== Service Worker for offline support (optional) =====
if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        // Uncomment to enable service worker
        // navigator.serviceWorker.register('/sw.js')
        //     .then(reg => console.log('Service Worker registered'))
        //     .catch(err => console.log('Service Worker registration failed'));
    });
}
