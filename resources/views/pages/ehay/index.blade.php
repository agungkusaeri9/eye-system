@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <div class="col-md-6 mb-3">
        <div class="card">
            <div class="card-header">
                <h5>Pending Ehay Request Summary</h5>
            </div>
            <div class="card-body">
                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Status</th>
                            <th scope="col">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($summaryData as $summary)
                            <tr class="mb-0 pb-0">
                                <th>{{ $loop->iteration }}</th>
                                <td>{{ $summary['status_text'] }}</td>
                                <td>{{ $summary['total'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- DataTable with Buttons -->
    <div class="card">
        <div class="card-header pb-0 d-flex gap-2">
            <button type="button" id="start-validation-btn" class="btn btn-danger d-none">
                Start All Validation
            </button>
        </div>
        <div class="card-datatable table-responsive pt-0">
            <table class="table" id="dataTable">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="select-all"></th>
                        <th>Ehay Number</th>
                        <th>Employee</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/tables-datatables-basic.js') }}"></script>
    <script>
        $(document).ready(function() {
            var table = $('#dataTable').DataTable({
                ajax: {
                    url: "{{ route('ehay.index') }}",
                    type: "GET",
                    data: function(d) {

                    }
                },
                processing: true,
                serverSide: true,
                columnDefs: [{
                        "defaultContent": "-",
                        "targets": "_all"
                    },

                ],
                order: [
                    [0, 'ASC']
                ],
                columns: [{
                        data: 'checkbox',
                        name: 'checkbox',
                        orderable: false,
                        searchable: false
                    },

                    {
                        data: 'code',
                        name: 'code'
                    },
                    {
                        data: 'employee',
                        name: 'employee'
                    },
                    {
                        data: 'current_log_status',
                        name: 'current_log_status'
                    },
                    {
                        data: 'action',
                        name: 'action'
                    },
                ],
                drawCallback: function() {
                    $('.row-checkbox').on('change', toggleValidationButton);
                }
            });
            $('#select-all').on('click', function() {
                var rows = $('#dataTable').DataTable().rows({
                    'search': 'applied'
                }).nodes();
                $('input[type="checkbox"].row-checkbox', rows).prop('checked', this.checked);
            });

            function toggleValidationButton() {
                let selected = $('input.row-checkbox:checked').length;
                if (selected > 0) {
                    $('#start-validation-btn').addClass('d-block').removeClass('d-none');
                } else {
                    $('#start-validation-btn').addClass('d-none').removeClass('d-block');
                }
            }

            // Checkbox select-all logic
            $('#select-all').on('click', function() {
                var rows = table.rows({
                    'search': 'applied'
                }).nodes();
                $('input.row-checkbox', rows).prop('checked', this.checked);
                toggleValidationButton();
            });

            // Individu checkbox change
            $(document).on('change', '.row-checkbox', function() {
                toggleValidationButton();
            });


            $('#start-validation-btn').on('click', function() {
                let selectedIds = [];
                $('input.row-checkbox:checked').each(function() {
                    selectedIds.push($(this).val());
                });

                if (selectedIds.length === 0) {
                    alert('Pilih minimal satu data!');
                    return;
                }

                // Buat form baru
                let form = document.createElement('form');
                form.method = 'POST';
                form.action = "{{ route('ehay.validation-process-admin-all') }}";

                // Tambahkan CSRF token
                let csrfTokenInput = document.createElement('input');
                csrfTokenInput.type = 'hidden';
                csrfTokenInput.name = '_token';
                csrfTokenInput.value = '{{ csrf_token() }}';
                form.appendChild(csrfTokenInput);

                // Tambahkan semua ID yang dipilih ke dalam form
                selectedIds.forEach(function(id) {
                    let input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'ids[]'; // array input
                    input.value = id;
                    form.appendChild(input);
                });

                // Tambahkan form ke body dan submit
                document.body.appendChild(form);
                form.submit();
            });

        })
    </script>
@endsection
