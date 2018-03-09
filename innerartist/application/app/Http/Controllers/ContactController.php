<?php namespace App\Http\Controllers;

use Hash;
use App\Contact;
use Auth, Input;
use App\Services\SpaceUsage;

class ContactController extends Controller {

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
        return Contact::all();
	}

    public function contactUser()
    {
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $contactuser = Contact::insert(['contact_for' =>$objData['contact_for'],'name' =>$objData['name'],'email' =>$objData['email'],'subject' =>$objData['subject'],'tell_more' =>$objData['tell_more']]);
        ;
        if($contactuser == 1){
            $to = "akshitamishra08@gmail.com";
            $subject = "My subject";
            $txt = $objData['email']."Submitting Contact us form .";
            $headers = "From: webmaster@example.com" . "\r\n" .
            "CC: somebodyelse@example.com";
            mail($to,$subject,$txt,$headers);
        }
        return json_encode(array('status'=>true));
    }

    public function postUser()
    {
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $update_user = Account::where('id', $objData['id'])->update(['first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'email' =>$objData['email'],'address' =>$objData['address'],'password' =>$objData['password']]);
         /*print_r($update_user);*/
    }

    public function getShippingAddress()
    {
        $results = array();
        $data = Auth::user();
        $results['shipping'] = Shipping::where('user_id',$data['id'])->get()->first();        
        $results['billing'] = Billing::where('user_id',$data['id'])->get()->first();
        return $results;
    }

   /* public function getBillingAddress()
    {
       
    }*/

    public function updateShippingAddress()
    {
        $data = Auth::user();
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        if(Shipping::where('user_id',$data['id'])->get()->count()>0){
            $update_shipping = Shipping::where('id', $objData['id'])->update(['first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip']]);
        }else{
            Shipping::insert(['user_id'=>$data['id'],'first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip']])->getQueryLog();
        }
    }

    public function updateBillingAddress()
    {
        $data = Auth::user();
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        if(Billing::where('user_id',$data['id'])->get()->count()>0){
            $update_billing = Billing::where('id', $objData['id'])->update(['first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip']]);
        }else{
            Billing::insert(['user_id'=>$data['id'],'first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip']])->getQueryLog();
        }
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