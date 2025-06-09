<?php

namespace App\Http\Controllers;

use App\Models\EhayFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EhayFileController extends Controller
{
    public function destroy($id)
    {
        $file = EhayFile::findOrFail($id);

        // Delete the physical file
        if ($file->file) {
            Storage::disk('public')->delete($file->file);
        }

        // Delete the database record
        $file->delete();

        return redirect()->back()->with('success', 'File berhasil dihapus');
    }
}
