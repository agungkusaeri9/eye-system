@extends('layouts.master')

@push('vendor-style')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css">
<style>
.image-gallery {
    height: calc(100vh - 250px);
    overflow-y: auto;
}
.image-card {
    transition: all 0.3s ease;
}
.image-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}
</style>
@endpush

@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">Ehay /</span> Pengajuan
    </h4>

    <div class="row">
        <!-- Form Edit di Sebelah Kiri -->
        <div class="col-md-8">
            <div class="card">
                <h5 class="card-header">Edit Detail Pasien</h5>
                <form method="POST" action="{{ route('ehay-detail.update', $detail->uuid) }}" enctype="multipart/form-data" id="mainForm">
                    @method('patch')
                    @csrf
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <h6 class="mb-2">Data Pasien dan Pengobatan</h6>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <div class='form-group'>
                                                <label for='cost_treatment' class='mb-1'>Biaya Pengobatan</label>
                                                <input type='text' name='cost_treatment' id='cost_treatment'
                                                    class='form-control' value="{{ $detail->cost_treatment }}"
                                                    oninput="formatNumber(this); calculateTotal();">
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class='form-group'>
                                                <label for='cost_care1' class='mb-1'>Biaya Perawatan 1</label>
                                                <input type='text' name='cost_care1' id='cost_care1'
                                                    class='form-control' value="{{ $detail->cost_care1 }}"
                                                    oninput="formatNumber(this); calculateTotal();">
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class='form-group'>
                                                <label for='cost_care2' class='mb-1'>Biaya Perawatan 2</label>
                                                <input type='text' name='cost_care2' id='cost_care2'
                                                    class='form-control' value="{{ $detail->cost_care2 }}"
                                                    oninput="formatNumber(this); calculateTotal();">
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class='form-group'>
                                                <label for='cost_glasses' class='mb-1'>Biaya Kacamata</label>
                                                <input type='text' name='cost_glasses' id='cost_glasses'
                                                    class='form-control' value="{{ $detail->cost_glasses }}"
                                                    oninput="formatNumber(this); calculateTotal();">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Keterangan dan Upload -->
                                <div class="mb-3">
                                    <h6 class="mb-2">Keterangan dan Upload File</h6>
                                    <div class="row">
                                        <div class="col-12 mb-3">
                                            <div class='form-group'>
                                                <label for='keterangan' class='mb-1'>Keterangan</label>
                                                <input type='text' name='keterangan' id='keterangan'
                                                    class='form-control' value="{{ $detail->keterangan }}">
                                            </div>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <div class='form-group'>
                                                <label for='files' class='mb-1'>Upload File (JPG,PNG)</label>
                                                <input type='file' name='files[]' id='files'
                                                    class='form-control' accept="image/jpeg,image/png" multiple
                                                    onchange="previewFiles(this);">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Preview File Baru -->
                                <div class="row mt-3" id="new-file-preview-container"></div>

                                <!-- Total Nominal -->
                                <div class="card bg-primary text-white mb-3">
                                    <div class="card-body">
                                        <h6 class="mb-2">Total Nominal</h6>
                                        <h3 class="mb-0">Rp <span id="total_nominal">0</span></h3>
                                    </div>
                                </div>

                                <div class="text-end">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fa fa-save me-2"></i>
                                        <span class="align-middle">Simpan</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- List Gambar di Sebelah Kanan -->
        <div class="col-md-4">
            <div class="card">
                <h5 class="card-header">
                    Daftar File
                    <span class="badge bg-primary float-end" id="file-count">{{ $detail->files->count() }}</span>
                </h5>
                <div class="card-body p-2 image-gallery">
                    <div class="row g-2" id="file-preview-container">
                        @foreach($detail->files as $file)
                        <div class="col-12" id="file-{{ $file->id }}">
                            <div class="card image-card">
                                <img src="{{ asset('storage/' . $file->file) }}" 
                                     class="card-img-top" 
                                     style="height: 200px; object-fit: cover;"
                                     onclick="previewImage('{{ asset('storage/' . $file->file) }}')"
                                >
                                <div class="card-body p-2">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">{{ \Carbon\Carbon::parse($file->created_at)->format('d/m/Y H:i') }}</small>
                                        <form action="{{ route('ehay-file.destroy', $file->id) }}" method="POST" 
                                              onsubmit="return confirmDelete(event, this);" 
                                              class="d-inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Preview -->
    <div class="modal fade" id="modalPreview" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Preview File</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <img src="" id="previewImage" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
@endsection

@section('page-script')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<script>
// Format number with thousand separator
function formatNumber(input) {
    if (!input.value) return;
    
    // Remove non-numeric characters
    let value = input.value.replace(/[^0-9]/g, '');
    
    // Format with thousand separator
    if (value) {
        value = parseInt(value).toLocaleString('id-ID');
        input.value = value.replace(/\./g, ',');
    }
}

// Calculate total from all cost inputs
function calculateTotal() {
    let total = 0;
    const fields = ['cost_treatment', 'cost_care1', 'cost_care2', 'cost_glasses'];
    
    fields.forEach(field => {
        const input = document.getElementById(field);
        if (input.value) {
            total += parseInt(input.value.replace(/,/g, '')) || 0;
        }
    });

    document.getElementById('total_nominal').textContent = total.toLocaleString('id-ID');
}

// Preview uploaded files
function previewFiles(input) {
    const container = document.getElementById('new-file-preview-container');
    container.innerHTML = '';

    Array.from(input.files).forEach((file, index) => {
        const reader = new FileReader();
        reader.onload = function(e) {
            const div = document.createElement('div');
            div.className = 'col-md-4 mb-3';
            div.innerHTML = `
                <div class="card image-card">
                    <img src="${e.target.result}" class="card-img-top" style="height: 200px; object-fit: cover;">
                    <div class="card-body p-2">
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted">${file.name}</small>
                            <button type="button" class="btn btn-danger btn-sm" onclick="removeNewFile(${index}, this)">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `;
            container.appendChild(div);
        };
        reader.readAsDataURL(file);
    });
}

// Remove new file from preview
function removeNewFile(index, button) {
    const fileInput = document.getElementById('files');
    const dt = new DataTransfer();

    Array.from(fileInput.files)
        .filter((_, i) => i !== index)
        .forEach(file => dt.items.add(file));

    fileInput.files = dt.files;
    button.closest('.col-md-4').remove();
}

// Preview image in modal
function previewImage(src) {
    document.getElementById('previewImage').src = src;
    const modal = new bootstrap.Modal(document.getElementById('modalPreview'));
    modal.show();
}

// Confirm delete with SweetAlert2
function confirmDelete(event, form) {
    event.preventDefault();
    
    Swal.fire({
        title: 'Konfirmasi Hapus',
        text: 'Apakah Anda yakin ingin menghapus file ini?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya, Hapus',
        cancelButtonText: 'Batal',
        confirmButtonColor: '#dc3545',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            form.submit();
        }
    });
    
    return false;
}

// Initialize
document.addEventListener('DOMContentLoaded', function() {
    // Format all cost inputs on load
    const costInputs = document.querySelectorAll('input[id^="cost_"]');
    costInputs.forEach(input => formatNumber(input));
    
    // Calculate initial total
    calculateTotal();
});
</script>
@endsection
