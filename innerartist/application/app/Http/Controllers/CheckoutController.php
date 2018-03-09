<?php namespace App\Http\Controllers;

use Hash;
use App\Order;
use App\Shipping;
use App\Billing;
use App\PromoCode;
use App\ProductCart;
use Auth, Input;
use App\Services\SpaceUsage;

class CheckoutController extends Controller {

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
        return Account::all();
	}

    public function getOrder()
    {
        $data = Auth::user();
        return Order::join('dp_products', 'dp_orders.product_id', '=', 'dp_products.id','left') ->select('dp_orders.*', 'dp_products.path_image', 'dp_products.title')->where('dp_orders.user_id',$data['id'])->get();
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

    public function getShippingDetail()
    {
        $data = Auth::user();
        return Shipping::where('user_id',$data['id'])->first();
    }

    public function getBillingDetail(){
        $data = Auth::user();
        $results = array();
        $results['billing'] = Billing::where('user_id',$data['id'])->first();
        $results['shipping'] = Shipping::where('user_id',$data['id'])->first();
        return $results;
    }

    public function updateShippingDetail()
    {
        $data = Auth::user();
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        if(Shipping::where('user_id',$data['id'])->get()->count()>0){
            $update_shipping = Shipping::where('id', $objData['id'])->update(['first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip'],'order_note' =>$objData['order_note']]);
            return array('success' =>true);
        }else{
            Shipping::insert(['user_id'=>$data['id'],'first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip'],'order_note' =>$objData['order_note']]);
            return array('success' =>true);
        }
    }

    public function updateBillingDetail()
    {
        $data = Auth::user();
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        /*print_r($objData);exit;*/
        if(Billing::where('user_id',$data['id'])->get()->count()>0){
            $update_billing = Billing::where('id', $objData['id'])->update(['first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip'],'phone' =>$objData['phone'],'email' =>$objData['email']]);
            return array('success' =>true);
        }else{
            $add_billing = Billing::insert(['user_id'=>$data['id'],'first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip'],'phone' =>$objData['phone'],'email' =>$objData['email']]);
            return array('success' =>true);
        }
    }

    public function checkPromoCode()
    {
        $data = Auth::user();
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        /*print_r($objData);exit;*/
        $is_valid = PromoCode::where(array('coupon_code'=>$objData['coupon_code'],'status'=>1))->get();
        if($is_valid->count()>0){
            return array('success' =>true , 'data' =>$is_valid);
        }/*else{
            return array('success' =>"Invalid Coupon Code Please Try again" );
        }*/
        /*print_r($is_valid);exit;*/
        /*if(PromoCode::where('user_id',$data['id'])->get()->count()>0){
            $update_billing = Billing::where('id', $objData['id'])->update(['first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip'],'phone' =>$objData['phone'],'email' =>$objData['email']]);
            return array('success' =>true);
        }else{
            $add_billing = Billing::insert(['user_id'=>$data['id'],'first_name' =>$objData['first_name'],'last_name' =>$objData['last_name'],'company' =>$objData['company'],'country' =>$objData['country'],'city' =>$objData['city'],'state' =>$objData['state'],'zip' =>$objData['zip'],'phone' =>$objData['phone'],'email' =>$objData['email']]);
            return array('success' =>true);
        }*/
    }

    public function placeOrder()
    {
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }
        $final = [];
        $t=0;
        foreach($objData['product'] as $row){
            $t = $t + $row->price; 
            $t = $t + $row->flat_rate;
            array_push($final, $row->product_id);
        }
        $explode = implode(",", $final);
        $objData['product_id'] = $explode;
        $objData['total_price'] = $t;
        $data = Auth::user();
        $placeOrders = Order::insert(['user_id'=>$data['id'],'product_id' =>$objData['product_id'],'total_price' =>$objData['total_price'],'shipping_address' =>$objData['shipping_country'],'shipping_state' =>$objData['shipping_state'],'shipping_zipcode' =>$objData['shipping_zipcode']]);
        foreach($objData['product'] as $row){
            ProductCart::where('id', $row->id)->delete();
        }
        return array('success' => true);
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