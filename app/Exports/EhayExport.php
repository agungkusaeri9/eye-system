<?php

namespace App\Exports;

use App\Models\Ehay;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Illuminate\Contracts\View\View;

class EhayExport implements FromView
{

    public $filter;
    public function __construct($filter = null)
    {
        $this->filter = $filter;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function view(): View
    {
        $data = Ehay::with(['employee', 'details'])->withSum('details', 'nominal_total')
            ->latest();

        // dd($data->get());

        if ($this->filter['from_date'] && $this->filter['to_date']) {
            $data->whereDate('created_at', '>=', $this->filter['from_date'])->whereDate('created_at', '<=', $this->filter['to_date']);
        } elseif ($this->filter['from_date'] && !$this->filter['to_date']) {
            $data->whereDate('created_at', $this->filter['from_date']);
        } else {
            $data->whereNotNull('created_at');
        }
        if ($this->filter['status'] === 'ready') {
            $data->where('status', 5);
        } else {
            $data->where('status', '!=', 5);
        }
        $items = $data->getByRole()->get();
        return view('pages.ehay.export-excel', [
            'items' => $items,
            'status' => $this->filter['status']
        ]);
    }
}
