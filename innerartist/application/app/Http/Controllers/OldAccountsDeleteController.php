<?php namespace App\Http\Controllers;

use App\Photo;
use App\Folder;
use App\User;
use Carbon\Carbon;
use DB, Storage, Image;
use App\Http\Controllers\Controller;

class OldAccountsDeleteController extends Controller {

    /**
     * Delete all accounts that are older then 2 days.
     *
     * @return Response
     */
    public function delete()
    {
        if ($_SERVER['REMOTE_ADDR'] !== $_SERVER['SERVER_ADDR']) {
            return response('You don\'t have permissions to do that.', 403);
        }

        $users = User::where('created_at', '<=', Carbon::now()->addDays(-2))->get();

        foreach($users as $user) {
            $user->folders()->where('name', '!=', 'root')->delete();
            $user->activity()->delete();
            $user->photos()->forceDelete();
            Storage::deleteDirectory('uploads/'.$user->id);
        }

        //delete download zip files
        $files = Storage::files('application/storage/app');

        Storage::delete(array_filter($files, function($file) {
            return str_contains($file, '.zip');
        }));

        //delete photos uploaded by not logged in users
        Storage::deleteDirectory('uploads/no-auth');
        Photo::whereNull('user_id')->where('created_at', '<=', Carbon::now()->addDays(-2))->forceDelete();

        return response('Users older then 2 days deleted successfully.', 200);
    }
}