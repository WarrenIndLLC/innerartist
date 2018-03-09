<?php namespace App\Http\Controllers;

use App\Photo;
use App\Folder;
use Input, Auth;
use Illuminate\Support\Str;
use App\Services\Photo\Deleter;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class FoldersController extends Controller {

    /**
     * Photo columns to get when lazy loading folder photos.
     *
     * @var array
     */
    private $photoColumns = ['created_at', 'updated_at', 'deleted_at', 'description', 'file_name', 'file_size', 'password', 'share_id', 'width', 'height', 'user_id', 'name', 'folder_id', 'id'];

    public function __construct(Deleter $deleter)
    {
        $this->middleware('loggedIn');

        $this->deleter = $deleter;
    }

    /**
     * Return all folders belonging to current user.
	 *
	 * @return string
	 */
	public function index()
	{
		return Folder::where('user_id', Auth::user()->id)->get();
	}

    /**
     * Create a new folder in database
     *
     * @param Request $request
     * @return Response
     */
	public function store(Request $request)
	{
        $this->validate($request, [
            'name' => 'required|max:255'
        ]);

        //check if user already has folder with this name
        if (Auth::user()->folders()->where('name', Input::get('name'))->first()) {
            return response()->json(trans('app.folderAlreadyExists'), 422);
        }

        return Auth::user()->folders()->create(['name' => Input::get('name'), 'share_id' => Str::random(15)]);
	}

	/**
	 * Find and return a folder with given id (if current user has access to it)
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$folder = Folder::with(['photos' => function($q) {
            $q->with('labels')->select($this->photoColumns)->limit(50);
        }])->findOrFail($id);

        if ($folder->name !== 'root' && $folder->user_id !== Auth::user()->id) {
            abort(404);
        }

        return $folder;
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id, Request $request)
	{
		$this->validate($request, [
            'name' => 'min:1|max:255|not_in:root'
        ]);

        $folder = Auth::user()->folders()->findOrFail($id);

        foreach (Input::all() as $key => $value) {
            $folder->$key = $value;
        }

        $folder->save();

        return $folder;
	}
}
