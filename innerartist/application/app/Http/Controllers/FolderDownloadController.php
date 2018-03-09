<?php namespace App\Http\Controllers;

use Storage;
use ZipArchive;
use App\Folder;
use Carbon\Carbon;

class FolderDownloadController extends Controller {

    /**
     * Zip and download photos that belong to given folder.
     *
     * @param  int|string $id
     * @return Response
     */
	public function download($id)
	{
        $folder = Folder::with('photos')->where('share_id', $id)->firstOrFail();

        $path = base_path('storage/app/-'.Carbon::now()->timestamp.'-'.str_random(10).'.zip');

        $this->DeleteOldZips();

        $zip = new ZipArchive();
        $zip->open($path, ZipArchive::CREATE);

        foreach($folder->photos as $photo) {
            $zip->addFromString($photo->name, file_get_contents($photo->getAbsolutePath()));
        }

        if ($zip->close()) {
            return response()->download($path, $folder->name.'.zip', ['Content-Type' => 'application/zip, application/octet-stream']);
        }

        return response(trans('app.folderDownloadProblem'), 500);
	}

    /**
     * Delete old zip files from the folder (older then one day)
     *
     * return void
     */
    private function DeleteOldZips()
    {
        $files = Storage::files('storage/app');

        foreach ($files as $fileName) {
            preg_match('/.+-([0-9]+)-.+/ms', $fileName, $matches);

            if (isset($matches[1]) && Carbon::createFromTimestamp($matches[1])->isYesterday()) {
                Storage::delete($fileName);
            }
        }
    }
}
