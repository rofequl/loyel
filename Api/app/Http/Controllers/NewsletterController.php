<?php

namespace App\Http\Controllers;

use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\User;
use Illuminate\Support\Facades\Mail;

class NewsletterController extends Controller
{
    use ApiResponse;

    public function index()
    {
        return DB::table('subscribers')->get();
    }

    public function newsletterIndex()
    {
        $collection = collect();
        $subscriber = collect();
        $supplier = collect();
        $buyer = collect();
        $both = collect();

        foreach (DB::table('subscribers')->get()->pluck('email') as $email) {
            $subscriber->push($email);
        }

        foreach (User::where('status', 1)->whereNotNull('email')->select('email', 'user_type')->get() as $email) {
            if ($email->user_type == 3) {
                $both->push($email->email);
            } elseif ($email->user_type == 2) {
                $supplier->push($email->email);
            } elseif ($email->user_type == 0) {
                $buyer->push($email->email);
            }
        }

        if (count($subscriber) > 0) $collection->push(['title' => 'Subscribers', 'elements' => $subscriber]);
        if (count($supplier) > 0) $collection->push(['title' => 'Supplier', 'elements' => $supplier]);
        if (count($buyer) > 0) $collection->push(['title' => 'Buyer', 'elements' => $buyer]);
        if (count($both) > 0) $collection->push(['title' => 'Both', 'elements' => $both]);

        return $collection;

    }

    public function bulkSMSIndex()
    {
        $collection = collect();
        $supplier = collect();
        $buyer = collect();
        $both = collect();

        foreach (User::where('status', 1)->whereNotNull('mobile')->select('mobile', 'user_type')->get() as $email) {
            if ($email->user_type == 3) {
                $both->push($email->mobile);
            } elseif ($email->user_type == 2) {
                $supplier->push($email->mobile);
            } elseif ($email->user_type == 0) {
                $buyer->push($email->mobile);
            }
        }
        if (count($supplier) > 0) $collection->push(['title' => 'Supplier', 'elements' => $supplier]);
        if (count($buyer) > 0) $collection->push(['title' => 'Buyer', 'elements' => $buyer]);
        if (count($both) > 0) $collection->push(['title' => 'Both', 'elements' => $both]);

        return $collection;

    }

    public function newsletterSend(Request $request)
    {
        if (env('MAIL_USERNAME') != null) {
            $email = $request->email;
            if (count($email) > 0) {
                $content = $request->message;
                $subject = $request->subject;
                $general = DB::table('generals')->get()->first();
                $footer = DB::table('footers')->get()->first();
                try {
                    Mail::send('email.newsletter', ['content' => $content, 'general' => $general, 'footer' => $footer],
                        function ($mail) use ($email, $subject, $general) {
                            $mail->from(env('MAIL_USERNAME'), $general->app_name);
                            $mail->to($email)->subject($subject);
                        });
                } catch (\Exception $e) {
                    return $this->errorResponse($e->getMessage());
                }
                return $this->successResponse('Message send successfully');
            } else return $this->errorResponse('No email selected');
        } else {
            return $this->errorResponse('No mail setup');
        }
    }

    public function bulkSMSSend(Request $request)
    {
        try {
            if (count($request->mobile) > 0) {
                $post_url = 'https://api.mobireach.com.bd/SendTextMessage';
                $post_values = array(
                    'Username' => env('MOBIREACH_USER'),
                    'Password' => env('MOBIREACH_PASS'),
                    'From' => env('MOBIREACH_FROM'),
                    'To' => implode(",", $request->mobile),
                    'Message' => $request->message,
                );

                $post_string = "";
                foreach ($post_values as $key => $value) {
                    $post_string .= "$key=" . urlencode($value) . "&";
                }
                $post_string = rtrim($post_string, "& ");

                $request = curl_init($post_url);
                curl_setopt($request, CURLOPT_HEADER, 0);
                curl_setopt($request, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($request, CURLOPT_POSTFIELDS, $post_string);
                curl_setopt($request, CURLOPT_SSL_VERIFYPEER, FALSE);
                $post_response = curl_exec($request);
                curl_close($request);

                return $this->successResponse('Message send successfully');
            } else return $this->errorResponse('No number selected');
        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage());
        }
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email|max:255|unique:subscribers',
        ]);
        DB::table('subscribers')->insert([
            'email' => $request->email,
        ]);
    }

    public function destroy($id)
    {
        DB::table('subscribers')->where('id', $id)->delete();
    }
}
