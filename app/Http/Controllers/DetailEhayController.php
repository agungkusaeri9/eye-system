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
            'files.*' => 'nullable|image|mimes:jpeg,png|max:1024',
        ], [
            'files.*.max' => 'Ukuran file tidak boleh lebih dari 1MB.',
            'files.*.mimes' => 'File harus berformat JPG atau PNG.',
            'files.*.image' => 'File harus berupa gambar.'
        ]);

        // Additional file size and count validation (in case frontend validation is bypassed)
        if ($request->hasFile('files')) {
            // Check file count limit
            if (count($request->file('files')) > 5) {
                return redirect()->back()
                    ->withErrors(['files' => 'Maksimal hanya boleh upload 5 file.'])
                    ->withInput();
            }

            foreach ($request->file('files') as $file) {
                if ($file && $file->getSize() > 1048576) { // 1MB in bytes
                    return redirect()->back()
                        ->withErrors(['files' => "File {$file->getClientOriginalName()} terlalu besar. Maksimal ukuran file adalah 1MB."])
                        ->withInput();
                }
            }
        }

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
                ($request->cost_treatment ?? 0) +
                ($request->cost_care1 ?? 0) +
                ($request->cost_care2 ?? 0) +
                ($request->cost_glasses ?? 0);

            $detail->update($data);

            $nominalExecEdit = EhayDetail::where('ehay_id', $detail->ehay_id)->whereNot('id', $detail->id)->sum('nominal_total');
            $nominalCalculate =  $data['nominal_total'];
            $nominalTotal = $nominalExecEdit + $nominalCalculate;

            // dd($nominalExecEdit, $nominalCalculate, $nominalTotal);

            // update status ehay
            $detail->ehay->update([
                'status' => 1,
                'nominal_total' => $nominalTotal
            ]);
            $detail->ehay->logStatus()->create([
                'name' => 'Waiting for HCGS Admin Validation',
                'status' => 1
            ]);

            DB::commit();
            return redirect()->route('ehay.customer-list')->with('success', 'Data berhasil direvisi.');
        } catch (\Exception $e) {
            // dd($e->getMessage());
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
