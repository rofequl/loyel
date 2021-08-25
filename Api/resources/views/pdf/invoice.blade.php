<div id="invoice">
    <div class="invoice overflow-auto">
        <div style="min-width: 600px">
            <header>
                <div class="row">
                    <div class="col">
                        <img src="{{Image::make($general->logo_black)->encode('data-url')}}"
                             data-holder-rendered="true" width="150px" style="position: absolute;top: 40px"/>
                    </div>
                    <div class="col company-details">
                        <h2 class="name">
                            {{$general->app_name}}
                        </h2>
                        <div>{{$footer->address}}</div>
                        <div>{{$footer->phone}}</div>
                        <div>{{$footer->email}}</div>
                    </div>
                </div>
            </header>
            <main>
                <div class="row contacts">
                    <div class="col invoice-to">
                        <h2 class="to">{{$result["shipping_address"]->full_name}}</h2>
                        <div class="address">{{$result["shipping_address"]->address}}
                            , {{$result["shipping_address"]->area}}, {{$result["shipping_address"]->city}},
                            {{$result["shipping_address"]->region}}</div>
                        <div class="email"><a
                                href="tel:{{$result["shipping_address"]->phone_number}}">{{$result["shipping_address"]->phone_number}}</a>
                        </div>
                        <div class="email"><a
                                href="mailto:{{$result["customer_email"]}}">{{$result["customer_email"]}}</a></div>
                    </div>
                    <div class="col invoice-details">
                        <img src="data:image/png;base64,{{ $barcode->getBarcodePNG($result["order_code"],'C39') }}"
                             height="50" width="150"/>
                        <p>Invoice ID: {{$result["order_code"]}}</p>
                        <div class="date">Date of Invoice: {{$result["created_at"]}}</div>
                        <div class="date">Payment
                            Method: {{$result["payment_type"] == 1 ? 'Cash on delivery' : ''}}</div>
                    </div>
                </div>
                <table border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr>
                        <th class="text-left">DESCRIPTION</th>
                        <th class="text-right">UNIT PRICE</th>
                        <th class="text-right">DISCOUNT</th>
                        <th class="text-right">QUANTITY</th>
                        <th class="text-right">TOTAL</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($result["order_product"] as $product)
                        <tr>
                            <td class="text-left"><h3>{{$product['name']}}</h3>
                                <small>SKU: {{ $product["sku"] }}
                                    @if($product["price_type"] == 2)
                                        <p>     @foreach($product["product_details"] as $key => $value)
                                                <span
                                                    class="text-capitalize font-weight-bold">{{$key}}: </span>{{$value}}
                                            @endforeach
                                        </p>
                                    @endif
                                </small>
                            </td>
                            <td class="unit">TK {{$product["unit_price"]}}</td>
                            <td class="qty">TK {{$product["discount_price"]}}</td>
                            <td class="unit">{{$product["quantity"]}}</td>
                            <td class="total">TK {{$product["total"]}}</td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="2"></td>
                        <td colspan="2">SUBTOTAL</td>
                        <td>TK {{$result["subtotal"]}}</td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td colspan="2">SHIPPING</td>
                        <td>TK {{$result["shipping"]}}</td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td colspan="2">GRAND TOTAL</td>
                        <td>TK {{$result["total"]}}</td>
                    </tr>
                    </tfoot>
                </table>
            </main>
        </div>
        <div></div>
    </div>
</div>
<style>
    #invoice {
        padding: 10px;
    }

    .invoice {
        position: relative;
        background-color: #FFF;
        min-height: 680px;
        padding: 15px
    }

    .invoice header {
        padding: 10px 0;
        margin-bottom: 20px;
        border-bottom: 1px solid #3989c6
    }

    .invoice .company-details {
        text-align: right
    }

    .invoice .company-details .name {
        margin-top: 0;
        margin-bottom: 0
    }

    .invoice .contacts {
        margin-bottom: 0px
    }

    .invoice .invoice-to {
        text-align: left
    }

    .invoice .invoice-to .to {
        margin-top: 0;
        margin-bottom: 0
    }

    .invoice .invoice-details {
        text-align: right
    }

    .invoice .invoice-details .invoice-id {
        margin-top: 0;
        color: #3989c6
    }

    .invoice main {
        padding-bottom: 50px
    }

    .invoice main .thanks {
        margin-top: -100px;
        font-size: 2em;
        margin-bottom: 50px
    }

    .invoice main .notices {
        padding-left: 6px;
        border-left: 6px solid #3989c6
    }

    .invoice main .notices .notice {
        font-size: 1.2em
    }

    .invoice table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 20px
    }

    .invoice table td, .invoice table th {
        padding: 8px 12px;
        background: #eee;
        border-bottom: 1px solid #fff
    }

    .invoice table th {
        white-space: nowrap;
        font-weight: 400;
        font-size: 14px
    }

    .invoice table td h3 {
        margin: 0;
        font-weight: 400;
        color: #3989c6;
        font-size: 1em
    }

    .invoice table .qty, .invoice table .total, .invoice table .unit {
        text-align: right;
        font-size: 1em
    }

    .invoice table .no {
        color: #fff;
        font-size: 1.6em;
        background: #3989c6
    }

    .invoice table .unit {
        background: #ddd
    }

    .invoice table .total {
        background: #3989c6;
        color: #fff
    }

    .invoice table tbody tr:last-child td {
        border: none
    }

    .invoice table tfoot td {
        background: 0 0;
        border-bottom: none;
        white-space: nowrap;
        text-align: right;
        padding: 10px 20px;
        font-size: 1.2em;
        border-top: 1px solid #aaa
    }

    .invoice table tfoot tr:first-child td {
        border-top: none
    }

    .invoice table tfoot tr:last-child td {
        color: #3989c6;
        font-size: 1.4em;
        border-top: 1px solid #3989c6
    }

    .invoice table tfoot tr td:first-child {
        border: none
    }

    .invoice footer {
        width: 100%;
        text-align: center;
        color: #777;
        border-top: 1px solid #aaa;
        padding: 8px 0
    }

    @media print {
        .invoice {
            font-size: 11px !important;
            overflow: hidden !important
        }

        .invoice footer {
            position: absolute;
            bottom: 10px;
            page-break-after: always
        }

        .invoice > div:last-child {
            page-break-before: always
        }
    }

    .row {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-right: -15px;
        margin-left: -15px
    }

    .col {
        -ms-flex-preferred-size: 0;
        flex-basis: 0;
        -ms-flex-positive: 1;
        flex-grow: 1;
        max-width: 100%;
        position: relative;
        width: 100%;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px
    }

    .col {
        -ms-flex-preferred-size: 0;
        flex-basis: 0;
        -ms-flex-positive: 1;
        flex-grow: 1;
        max-width: 100%
    }

    .text-left {
        text-align: left !important
    }

    .text-right {
        text-align: right !important
    }

    .text-capitalize {
        text-transform: capitalize !important
    }

    .font-weight-bold {
        font-weight: 700 !important
    }

    body {
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 0.8rem;
        font-weight: 400;
        line-height: 1.5;
        color: #212529;
        text-align: left;
        background-color: #fff
    }

    [tabindex="-1"]:focus {
        outline: 0 !important
    }

    h1, h2, h3, h4, h5, h6 {
        margin-top: 0;
        margin-bottom: .5rem
    }

    p {
        margin-top: 0;
        margin-bottom: 1rem;
    }

    small {
        font-size: 80%
    }

</style>
