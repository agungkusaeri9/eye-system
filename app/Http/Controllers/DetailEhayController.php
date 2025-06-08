<?php

namespace App\Http\Controllers;

use App\Models\EhayDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DetailEhayController extends Controller
{
    public function edit($uuid)
    {
        $detail = EhayDetail::where('uuid', $uuid)->firstOrFail();
        $title = 'Edit Data Detail Ehay';
        return view('pages.ehay-detail.edit', compact('detail', 'title'));
    }

    public function update(Request $request, $uuid)
    {
        $request->validate([
            'cost_treatment' => 'nullable',
            'care_type1' => 'nullable',
            'cost_care1' => 'nullable',
            'care_type2' => 'nullable',
            'cost_care2' => 'nullable',
            'cost_glasses' => 'nullable',
            'keterangan' => 'nullable',
            'file' => 'nullable|image|mimes:jpeg,png|max:2048',
        ]);

        $detail = EhayDetail::where('uuid', $uuid)->firstOrFail();
        $data = request()->only(['cost_treatment', 'care_type1', 'cost_care1', 'care_type2', 'cost_care2', 'cost_glasses', 'keterangan']);
        if ($request->hasFile('file')) {
            if ($detail->file) {
                Storage::disk('public')->delete($detail->file);
            }
            $file = $request->file('file');
            $data['file'] = $file->store('ehay-files', 'public');
        }
        $data['nominal_total'] = $detail->cost_treatment + $detail->cost_care1 + $detail->cost_care2 + $detail->cost_glasses;
        $detail->update($data);
        return redirect()->route('ehay.edit', $detail->ehay->uuid)->with('success', 'Data detail berhasil diubah');
    }

    public function destroy($uuid)
    {
        $detail = EhayDetail::where('uuid', $uuid)->firstOrFail();
        if ($detail->file) {
            Storage::disk('public')->delete($detail->file);
        }
        $detail->delete();
        return redirect()->route('ehay.edit', $detail->ehay->uuid)->with('success', 'Data detail berhasil dihapus');
    }
}
