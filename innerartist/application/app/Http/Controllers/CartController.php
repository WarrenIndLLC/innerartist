<?php namespace App\Http\Controllers;

use Hash;
use App\Cart;
use Auth, Input;
use App\Services\SpaceUsage;

class CartController extends Controller {

	/*public function __construct(SpaceUsage $usage)
    {
        $this->middleware('loggedIn');
         if ( ! IS_DEMO) {
            $this->middleware('admin');
        }
    }*/

    /**
     * Return a collection of all registered users.
     *
     * @return Collection
     */
	public function index()
	{
        return Cart::all();
	}

    public function getArtCart()
    {
        //$data = Auth::user();
        $ip = $_SERVER['REMOTE_ADDR'];
        $results = Cart::where('dp_art_cart.user_ip', $ip)->join('photos', 'dp_art_cart.art_id', '=', 'photos.id','left') ->select('dp_art_cart.*', 'photos.file_name', 'photos.user_id','photos.name','photos.width','photos.height')->get();
        return $results;
    }

    public function addtoCart()
    {
        $data = Auth::user();
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $ip = $_SERVER['REMOTE_ADDR'];
        Cart::insert(['user_ip'=>$ip,'art_id' =>$objData['art_id'],'status' =>1]);

        $results = Cart::where('dp_art_cart.user_ip', $ip)->join('photos', 'dp_art_cart.art_id', '=', 'photos.id','left') ->select('dp_art_cart.*', 'photos.file_name', 'photos.user_id', 'photos.name')->get();
        return json_encode(array('status'=>true,'data'=>$results));
    }

    public function removeArtCart()
    {
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        Cart::where('id', $objData['cartID'])->delete();

        $ip = $_SERVER['REMOTE_ADDR'];
        $results = Cart::where('dp_art_cart.user_ip', $ip)->join('photos', 'dp_art_cart.art_id', '=', 'photos.id','left') ->select('dp_art_cart.*', 'photos.file_name', 'photos.user_id', 'photos.name')->get();
        return json_encode(array('status'=>true,'data'=>$results));
    }

    public function deleteCartProduct()
    {
        $data = Auth::user();
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        Cart::where('id', $objData['id'])->delete();
    }

    
	/**
	 * Update given users information.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$currentUser = Auth::user();
        $input       = Input::all();
        $user        = User::findOrFail($id);

        if ($currentUser->isAdmin || $currentUser->id == $user->id) {

            //has the password if we get one passed in input
            if (isset($input['password'])) {
                $input['password'] = Hash::make($input['password']);
            }

            $user->fill($input)->save();

            return response($user, 200);
        }

        return response(trans('app.noPermissions'), 403);
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		return User::destroy($id);
	}

    /**
     * Delete all users given in input.
     *
     * return Response
     */
    public function destroyAll()
    {
        if ( ! Input::has('users')) return;

        $ids = [];

        foreach(Input::get('users') as $k => $user) {
            $ids[] = $user['id'];
        }

        if ($deleted = User::destroy($ids)) {
            return response(trans('app.deleted', ['number' => $deleted]));
        }
    }

    /**
     * Get disk space user is currently using.
     *
     * return int
     */
    public function getSpaceUsage()
    {
        return $this->spaceUsage->getSpaceUsed();
    }
}