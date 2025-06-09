<?php

namespace App\Http\Controllers;

use App\Models\EhayDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class DetailEhayController extends Controller
{
    public function edit($uuid)
    {
        $detail = EhayDetail::with('files')->where('uuid', $uuid)->firstOrFail();
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
            'files.*' => 'nullable|image|mimes:jpeg,png|max:2048',
        ]);

        try {
            DB::beginTransaction();

            $detail = EhayDetail::where('uuid', $uuid)->firstOrFail();
            $data = $request->only([
                'cost_treatment',
                'care_type1',
                'cost_care1',
                'care_type2',
                'cost_care2',
                'cost_glasses',
                'keterangan'
            ]);

            // Handle multiple file uploads
            if ($request->hasFile('files')) {
                foreach ($request->file('files') as $file) {
                    $filePath = $file->store('ehay-files', 'public');

                    // Create file record
                    $detail->files()->create([
                        'file' => $filePath,
                        'ehay_id' => $detail->ehay_id
                    ]);
                }
            }

            $data['nominal_total'] =
                ($detail->cost_treatment ?? 0) +
                ($detail->cost_care1 ?? 0) +
                ($detail->cost_care2 ?? 0) +
                ($detail->cost_glasses ?? 0);

            $detail->update($data);

            DB::commit();
            return redirect()
                ->route('ehay.edit', $detail->ehay->uuid)
                ->with('success', 'Data detail berhasil diubah');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()
                ->back()
                ->with('error', 'Terjadi kesalahan: ' . $e->getMessage())
                ->withInput();
        }
    }

    public function destroy($uuid)
    {
        $detail = EhayDetail::where('uuid', $uuid)->firstOrFail();

        // Delete all associated files
        foreach ($detail->files as $file) {
            if ($file->file) {
                Storage::disk('public')->delete($file->file);
            }
            $file->delete();
        }

        $detail->delete();
        return redirect()
            ->route('ehay.edit', $detail->ehay->uuid)
            ->with('success', 'Data detail berhasil dihapus');
    }
}
