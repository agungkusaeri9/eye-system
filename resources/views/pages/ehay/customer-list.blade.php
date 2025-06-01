@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <!-- DataTable with Buttons -->
    <div class="card">
        <div class="card-header pb-0 d-flex gap-2">
            <a href="#" id="start-validation-btn" class="btn btn-danger d-none">
                Start All Validation
            </a>
        </div>
        <div class="card-datatable table-responsive pt-0">
            <table class="table" id="dataTable">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Ehay Number</th>
                        <th>Description</th>
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
                    url: "{{ route('ehay.customer-list') }}",
                    type: "GET",
                    data: function(d) {
                        // d._user = $('#user').val(),
                        // d._start_date = $('#start_date').val(),
                        // d._end_date = $('#end_date').val()
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
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: true,
                        searchable: true
                    },

                    {
                        data: 'code',
                        name: 'code'
                    },
                    {
                        data: 'description',
                        name: 'description'
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

        })
    </script>
@endsection
