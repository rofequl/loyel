<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <title>Verify your email address</title>
</head>
<body>

<div>
    <table width="700" border="0" align="center" cellspacing="0" style="width:700px">
        <tbody>
        <tr>
            <td>
                <div style="width:700px;border-bottom:1px solid #cccccc;margin: 0 auto 30px;">
                </div>
                <div style="width:680px;padding:0 10px;margin:0 auto">
                    <div style="line-height:1.5;font-size:14px;margin-bottom:25px;color:#4d4d4d">
                        <strong style="display:block;margin-bottom:15px">
                            Hi {{ $name }},
                        </strong>
                        <strong style="display:block;margin-bottom:15px">
                            Please enter the following code
                            <span style="color:#ff6600;font-size:24px">{{$verification_code}}</span> to verify your
                            account.
                        </strong>
                    </div>

                    <div style="margin-bottom:30px">
                        <small style="display:block;margin-bottom:20px;font-size:12px">
                            <p style="color:#747474">
                                Please pay attention: <br>
                                After verification, you will be able to modify your password, login email address and
                                cell phone number. <br>
                                If you did not apply for a verification code, <br>
                                please sign in to your account and change your password to ensure your account's
                                security. <br>
                                In order to protect your account, please do not allow others access to your email.
                            </p>
                        </small>
                    </div>
                </div>
                <div style="width:700px;margin:0 auto">
                    <div
                        style="padding:10px 10px 0;border-top:1px solid #cccccc;color:#747474;margin-bottom:20px;line-height:1.3em;font-size:12.0px">
                        <p>2021 {{$general->app_name}} Group. All rights reserved.</p>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>


    <br/>
</div>

</body>
</html>
