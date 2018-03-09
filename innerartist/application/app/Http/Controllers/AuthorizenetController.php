<?php namespace App\Http\Controllers;

use Hash;
use App\User;
use Auth, Input;
use App\Services\SpaceUsage;

use App\Order;
use App\Shipping;
use App\Billing;
use App\ProductCart;

class AuthorizenetController extends Controller {

    private $api_login_id = '';         // API Login ID
    private $api_transaction_key = '';  // API Transaction Key
    private $api_url = '';              // Where we postin' to?
    
    private $post_vals = array();       // Values that get posted to Authroize.net

    /*
     * If your installation of cURL works without the "CURLOPT_SSL_VERIFYHOST"
     * and "CURLOPT_SSL_VERIFYPEER" options disabled, then remove them
     * from the array below for better security.
     */
    
    
    private $response = '';             // Response from Authorize.net
    private $transation_id = '';        // The transation ID from Authorize.net
    private $approval_code = '';        // The approval code from Authorize.net
    
    private $error = '';    

	public function __construct(SpaceUsage $usage)
    {
        
        $this->api_login_id  = '5exq56E6BHQU';
        $this->api_transaction_key = '5w33B2mGzD22J65F';
        $this->api_url = 'https://test.authorize.net/gateway/transact.dll'; // TEST URL
        //$this->api_url = 'https://secure.authorize.net/gateway/transact.dll'; // TEST URL
    }

    public function doPayment(){
        if(file_get_contents("php://input")){
            $data1 = file_get_contents("php://input"); 
            $objData = (array)json_decode($data1);
        }

        if(!isset($objData['cardnumber'])){
            return json_encode(array('success' => false,'message'=>"Please enter valid card number"));
            exit;
        }else if($objData['cardnumber']==''){
            return json_encode(array('success' => false,'message'=>"Please enter valid card number"));
            exit;
        }else if(!isset($objData['expdate'])){
            return json_encode(array('success' => false,'message'=>"Please enter valid exp date"));
            exit;
        }else if($objData['expdate']==''){
            return json_encode(array('success' => false,'message'=>"Please enter valid exp date"));
            exit;
        }else if(!isset($objData['cvv'])){
            return json_encode(array('success' => false,'message'=>"Please enter CVV number"));
            exit;
        }else if($objData['cvv']==''){
            return json_encode(array('success' => false,'message'=>"Please enter CVV number"));
            exit;
        }else if(!isset($objData['total_amount'])){
            return json_encode(array('success' => false,'message'=>"Please enter total amount"));
            exit;
        }else if($objData['total_amount']==''){
            return json_encode(array('success' => false,'message'=>"Please enter total amount"));
            exit;
        }else{
            $auth_net = array(
                'x_card_num'            => $objData['cardnumber'], // Visa
                'x_exp_date'            => $objData['expdate'], // Visa
                'x_card_code'           => $objData['cvv'], // Visa
                'x_description'         => 'purchase membership',
                'x_amount'              => $objData['total_amount'],
                'x_customer_ip'         => $_SERVER['REMOTE_ADDR'],
                'memberhip_id'          => "Pradosh",
                'months'=> "Soni"
            );
            $this->setData($auth_net);
            if($this->authorizeAndCapture()){
                $userData = Auth::user();
                $final = array();
                $arts = array();
                $quantity = array();
                foreach($objData['product'] as $row){
                    array_push($final, $row->id);
                    array_push($arts, $row->artid);
                    array_push($quantity, $row->quantity);
                    ProductCart::where('id', $row->id)->delete();
                }
                $data = array(
                    'user_id'=>$userData['id'],
                    'product_id' => implode(",", $final),
                    'art_id' => implode(",", $arts),
                    'quantity' => implode(",", $quantity),
                    'total_price'=> $objData['total_amount'],
                    'order_note'=> $objData['order_note'],
                    'status' => 'ordered',
                    'shipping_state'=> (isset($objData['shipping_state']))?$objData['shipping_state']:'',
                    'shipping_address'=> (isset($objData['shipping_country']))?$objData['shipping_country']:'',
                    'shipping_zipcode'=> (isset($objData['shipping_zipcode']))?$objData['shipping_zipcode']:'',
                );
                $placeOrders = Order::insert($data);
                return json_encode(array('success' =>true,'message'=>"Your payment is successfully completed,plan will be changed on your plan expiry date."));
                exit;
            }else{ 
                return json_encode(array('success' => false,'message'=>$this->getError()));
                exit;
            }
        }        
    }


    public function authorize(){
        $auth_net = array(
            'x_card_num'            => "4111111111111111", // Visa
            'x_exp_date'            => '12/2020',
            'x_card_code'           => "123",
            'x_description'         => 'purchase membership',
            'x_amount'              => "1210.1",
            'x_customer_ip'         => "192.168.1.3",
            'memberhip_id'          => 12,
            'months'=> 12
        );
        $this->setData($auth_net);
        if($this->authorizeAndCapture()){
            echo 'Your payment is successfully completed,plan will be changed on your plan expiry date.';
        }else{ 
            echo $this->getError();
        }
    }

    // Set the data that we're going to send
    public function setData( $data )
    {
        $this->post_vals = $data;
    }

    // Get the values we're going to send
    public function getPostVals()
    {
        $auth_net_vals = array(
            'x_login'               => $this->api_login_id,
            'x_tran_key'            => $this->api_transaction_key,
            'x_version'             => '3.1',
            'x_delim_char'          => '|',
            'x_delim_data'          => 'TRUE',
            'x_type'                => 'AUTH_CAPTURE',
            'x_method'              => 'CC',
            'x_relay_response'      => 'FALSE',
        );
        return array_merge($auth_net_vals, $this->post_vals);
    }

    // Authorize and capture a card
    public function authorizeAndCapture()
    {
        $url =$this->api_url;
        $fields = $this->getPostVals();
        $params = http_build_query($fields, NULL, '&');
        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $url );
        curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, 'POST' );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST,0);
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER,0);
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, $params );
        $result = curl_exec ( $ch );
        curl_close ( $ch );
        return $this->parseResponse($result);
    }

    // Parse the response back from Authorize.net
    public function parseResponse( $response )
    {
        if( $response === FALSE )
        {
            $this->error = 'There was a problem while contacting the payment gateway. Please try again.';
            return FALSE;
        }
        elseif( is_string($response) && strpos($response, '|') !== FALSE )
        {
            $res = explode('|', $response);
            
            if( isset($res[0]) )
            {
                switch( $res[0] )
                {
                    case '1': // Approved
                        $this->transation_id = isset($res[6]) ? $res[6] : '';
                        $this->approval_code = isset($res[4]) ? $res[4] : '';
                    return TRUE;
                    break;
                
                    case '2': // Declined
                    case '3': // Error
                    case '4': // Held for Review
                    if( isset($res[3]) )
                    {
                        $this->error = $res[3];
                    }
                    return FALSE;
                    break;
                
                    default: // ??
                    break;
                }
            }
            else
            {
                $this->error = 'There was a problem while contacting the payment gateway. Please try again.';
                return FALSE;
            }
        }
        
        $this->error = 'Received an unknown response from the payment gateway. Please try again.';
        return FALSE;
    }
    
    // Get the transation ID
    public function getTransactionId()
    {
        return $this->transation_id;
    }
    
    // Get the transation code
    public function getApprovalCode()
    {
        return $this->approval_code;
    }
    
    // Get the error text
    public function getError()
    {
        return $this->error;
    }
    
    // Dump some debug data to the screen
    public function debug()
    {
        echo "<h1>Authorize.NET AIM API</h1>\n";
        $url = $this->CI->curl->debug_request();
        echo "<p>URL: " . $url['url'] . "</p>\n";
        echo "<h3>Response</h3>\n";
        echo "<code>" . nl2br(htmlentities($this->response)) . "</code><br/>\n\n";
        echo "<hr>\n";

        if( $this->CI->curl->error_string )
        {
            echo "<h3>cURL Errors</h3>";
            echo "<strong>Code:</strong> " . $this->CI->curl->error_code . "<br/>\n";
            echo "<strong>Message:</strong> " . $this->CI->curl->error_string . "<br/>\n";
            echo "<hr>\n";
        }

        echo "<h3>cURL Info</h3>";
        echo "<pre>";
        print_r($this->CI->curl->info);
        echo "</pre>";
    }
    
    // Reset everything so we can try again
    public function clear()
    {
        $this->response = '';
        $this->transation_id = '';
        $this->approval_code = '';
        $this->error = '';
        $this->post_vals = array();
    }
}
