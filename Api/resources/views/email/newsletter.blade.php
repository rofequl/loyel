<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <title>Newsletter</title>
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
                    {!! $content !!}
                </div>
                <div style="width:700px;margin:0 auto">
                    <div
                        style="padding:10px 10px 0;border-top:1px solid #cccccc;color:#747474;margin-bottom:20px;line-height:1.3em;font-size:12.0px;text-align: center">
                        <p>© 2021 {{$general->app_name}} Group, {{$footer->address}}</p>
                        <p>PH: {{$footer->phone}}, Mail: {{$footer->email}}</p>
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
