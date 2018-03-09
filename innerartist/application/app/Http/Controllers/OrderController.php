<?php namespace App\Http\Controllers;

use Hash;
use App\Order;
use Auth, Input;
use App\Services\SpaceUsage;

class OrderController extends Controller {

	public function __construct(SpaceUsage $usage)
    {
        $this->middleware('loggedIn');
         if ( ! IS_DEMO) {
            $this->middleware('admin');
        }
    }

    /**
     * Return a collection of all registered users.
     *
     * @return Collection
     */
	public function index()
	{
        return Order::all();
	}
    
    public function getOrders(){
        $order = Order::join('dp_users', 'dp_users.id', '=', 'dp_orders.user_id','left')->join('account', 'dp_orders.user_id', '=', 'account.user_id','left')->join('dp_products', 'dp_orders.product_id', '=', 'dp_products.id','left') ->select('dp_orders.*', 'dp_users.first_name', 'dp_users.last_name', 'dp_users.email', 'account.billing_street_1', 'account.billing_city', 'account.billing_state', 'account.billing_country', 'account.shipping_street_1', 'account.shipping_city', 'account.shipping_state', 'account.shipping_country', 'dp_products.top_layer_image', 'dp_products.title')->get();
        /*return Order::all();*/
        return $order;
    }

    public function imageUpload()
    {
        echo "111";
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