<?php namespace App\Http\Controllers;

use Hash;
use DB;

use App\Indexhome;
use App\Photo;
use App\Activity;
use App\User;
use App\Favourite;
use App\Cart;
use Auth, Input;
use App\Services\SpaceUsage;

class ArtworkController extends Controller {

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
        return Photo::all();
	}

    public function getAllArtwork(){
        $currentUser = Auth::user();
        $is_status =0;
        if($currentUser){
            $results = DB::select("select * from `photos` where `photos`.`deleted_at` is null and (approve_status = ".$currentUser['id']." or `approve_status` = 1)");
        }else{
            $results = Photo::where('approve_status', 1)->get();
        }
        $ip = $_SERVER['REMOTE_ADDR'];
        //
        foreach ($results as $row) {            
            /*
                Check Fav Status
            */
            $r = Favourite::where(array('user_ip'=>$ip,'artwork_id' =>$row->id))->first(); 
            if(!empty($r)){
                $row->is_liked = $r->id;
            }else{
                $row->is_liked = false;
            }

            //  Check Cart Status
            $r = Cart::where(array('user_ip'=>$ip,'art_id' =>$row->id))->first(); 
            if(!empty($r)){
                $row->addedTOCart = $r->id;
            }else{
                $row->addedTOCart = false;
            }

            /*if(!empty($currentUser)){
                //  Check Cart Status
                $r = Cart::where(array('user_id'=>$currentUser['id'],'art_id' =>$row->id))->first(); 
                if(!empty($r)){
                    $row->addedTOCart = true;
                }else{
                    $row->addedTOCart = false;
                }
            }else{
                $row->addedTOCart = false;
            }*/
        }
        return $results;
    }


    public function getUersArtwork(){
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $results = Photo::where('user_id', $objData['user_id'])->get();
        return $results;
    }

    public function getArtwork()
    {
        $status = 0;
        return Photo::where('approve_status',$status)->get();
    }

    public function approveArtwork()
    {
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $user_email = User::where('id',$objData['user_id'])->first();
        $to = $user_email['email'];
        $subject = "My subject";
        $txt = "Your Artwork Has Been Approved.";
        $headers = "From: webmaster@innerartist.com";
        mail($to,$subject,$txt,$headers);
        Photo::where('id', $objData['id'])->update(['approve_status' =>$objData['approve_status']]);
    }

    public function denyArtwork()
    {
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $user_email = User::where('id',$objData['user_id'])->first();
        $to = $user_email['email'];
        $subject = "My subject";
        $txt = "Your Artwork Has Been Denied.".$objData['denial_reason'];
        $headers = "From: webmaster@example.com" . "\r\n" .
        "CC: somebodyelse@example.com";
        mail($to,$subject,$txt,$headers);
        Photo::where('id', $objData['id'])->update(['approve_status' =>$objData['approve_status'],'denial_reason' =>$objData['denial_reason']]);
    }

    public function addtoFavourite(){
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $currentUser = Auth::user();
        $ip = $_SERVER['REMOTE_ADDR'];
        if($objData['status']==1){
            if($currentUser)
                $uid = $currentUser['id'];
            else
                $uid = 0;

            Favourite::insert(['user_id'=>$uid,'user_ip'=>$ip,'artwork_id' =>$objData['art_id'],'status' =>$objData['status'],'type'=>'artwork']);
        }else{
            Favourite::where('artwork_id', $objData['art_id'])->delete();
        }
        return array('success' => true,'status'=>$objData['status']);
    }

    public function getFavouriteArtwork(){
        //$currentUser = Auth::user();
        $ip = $_SERVER['REMOTE_ADDR'];


        $results = Favourite::where('dp_favourite.user_ip', $ip)->join('photos', 'photos.id', '=', 'dp_favourite.artwork_id','right') ->select('photos.*','dp_favourite.id as fav_id', 'photos.user_id as photo_user_id')->get();
       
        //
        foreach ($results as $row) {            
            /*
                Check Fav Status
            */
            $row->is_liked = true;

            //  Check Cart Status
            $r = Cart::where(array('user_ip'=>$ip,'art_id' =>$row->id))->first(); 
            if(!empty($r)){
                $row->addedTOCart = $r->id;
            }else{
                $row->addedTOCart = false;
            }
        }
        return $results;
    }

    public function submitSellArtwork(){
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $currentUser = Auth::user();
        Photo::where('id', $objData['id'])->update(['approve_status' =>$objData['approve_status'],'price' =>$objData['price']]);
        return array('success' => true);
        /*'status'=>$objData['status']*/
    }

    public function getUsersArtwork(){
        $currentUser = Auth::user();
        $checkVendor = User::where(array('id'=> $currentUser['id'],'is_vendor'=>1))->get();
        if($checkVendor->count()>0){
            $results = Photo::where('user_id', $currentUser['id'])->join('users', 'users.id', '=', 'photos.user_id','right') ->select('photos.*',  'users.gallery_logo', 'users.about_gallery_artist')->get();
        }
        return $results;
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