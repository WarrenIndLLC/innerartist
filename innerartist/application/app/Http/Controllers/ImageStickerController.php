<?php namespace App\Http\Controllers;

use App, Input;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\ImageSticker;
use Auth, Image, Storage;

class ImageStickerController extends Controller {

    /**
     * Settings service instance.
     *
     * @var App\Services\Settings;
     */


    public function index()
    {
        return ImageSticker::all();
    }

    public function getStickerGrouped()
    {
        $results = ImageSticker::groupBy('category')->get();
        foreach ($results as $row) {
            $i = array();
            $items = ImageSticker::where('category',$row->category)->select('image_name')->get();
            foreach ($items as $r) {
                array_push($i, $r->image_name);
            }
            $row->items = $i;
        }
        return $results;
    }

    public function upload($type, Request $request)
    {
        $currentUser = Auth::user();

        //check if current user is trying to change his own avatar or if he's an admin
        if ( ! $currentUser->isAdmin) {
            return response(trans('app.noPermissions'), 403);
        }

        $this->validate($request, [
            'file' => 'required|mimes:jpeg,png,svg,jpg'
        ]);

        //resize image to 120x120 and encode as png
        $data = Image::make(Input::file('file'))->encode('png');
        $imageName = Str::random(10).'.png';
        $path = '/assets/images/stickers/'.$type.'/'.$imageName;

        $url  = url().$path;

        
        if (Storage::put($path, $data)) {
           ImageSticker::insert(['category'=>$type,'folder_name' =>'stickers/'.$type,'image_name' =>$imageName]);
            return $url;
        }

        return response(trans('app.genericError'), 500);
    }

    /**
     * Remove custom avatar from user with given id.
     *
     * @param  string|int $id
     * @return Response
     */
    public function remove($id)
    {
        $currentUser = Auth::user();

        //check if current user can remove the avatar
        if ( ! $currentUser->isAdmin) {
            return response(trans('app.noPermissions'), 403);
        }

        $results = ImageSticker::where('id',$id)->get()->first();

        $path = '/assets/images/stickers/'.$results->category.'/'.$results->image_name;

        $url  = url().$path;

        if ($url) {
            $this->deleteFromFilesystem($url);
            return response(trans('app.avatarRemoveSuccess'), 200);
        }
        ImageSticker::destroy($id);

        return response(trans('app.genericError'), 500);
    }

     /**
     * Delete avatar at given url from filesystem.
     *
     * @param string $url
     */
    public function deleteFromFilesystem($url)
    {
        Storage::delete(str_replace(url(), '', $url));
    }
}
