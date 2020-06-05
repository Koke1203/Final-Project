<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body>
        <%@ include file="/presentacion/header.jsp" %><br>
        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row py-4">
                        <div class="col col-sm-8">
                            <div id="local-box">
                                <div class="panel local-search">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <div id="local-timeslot" data-control="timepicker"> 
                                                    <div class="dropdown">
                                                        <button class="btn btn-light btn-timepicker btn-block dropdown-toggle text-truncate" type="button" id="orderTimePicker" data-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false">
                                                            <i class="fa fa-clock-o"></i>&nbsp;&nbsp;
                                                            <b>ASAP</b>
                                                        </button>

                                                        <div class="dropdown-menu" aria-labelledby="orderTimePicker">
                                                            <button type="button" class="dropdown-item py-2 active" data-timepicker-option="asap"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;ASAP</button>
                                                            <button type="button" class="dropdown-item py-2" data-timepicker-option="later"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Schedule Order</button>

                                                            <form class="dropdown-content px-4 py-3 hide" role="form" data-request="localBox::onSetOrderTime">
                                                                <input type="hidden" data-timepicker-control="type" value="asap">
                                                                <div class="form-group">
                                                                    <select class="form-control" data-timepicker-control="date" data-timepicker-label="Select a date" data-timepicker-selected="2020-06-04"><option value="2020-06-04">Thu 04</option><option value="2020-06-05">Fri 05</option><option value="2020-06-06">Sat 06</option><option value="2020-06-07">Sun 07</option><option value="2020-06-08">Mon 08</option><option value="2020-06-09">Tue 09</option></select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <select class="form-control" data-timepicker-control="time" data-timepicker-label="Select a time" data-timepicker-selected="20:11"><option value="">Select a time</option><option value="20:15">Thu 08:15 pm</option><option value="20:30">Thu 08:30 pm</option><option value="20:45">Thu 08:45 pm</option><option value="21:00">Thu 09:00 pm</option><option value="21:15">Thu 09:15 pm</option><option value="21:30">Thu 09:30 pm</option><option value="21:45">Thu 09:45 pm</option><option value="22:00">Thu 10:00 pm</option><option value="22:15">Thu 10:15 pm</option><option value="22:30">Thu 10:30 pm</option><option value="22:45">Thu 10:45 pm</option><option value="23:00">Thu 11:00 pm</option><option value="23:15">Thu 11:15 pm</option><option value="23:30">Thu 11:30 pm</option><option value="23:45">Thu 11:45 pm</option></select>
                                                                </div>
                                                                <button type="button" class="btn btn-primary text-nowrap" data-timepicker-submit="" data-attach-loading="">
                                                                    Set Delivery Time            </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <form id="location-search" method="POST" role="form" data-request="localBox::onSearchNearby">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fa fa-map-marker"></i></span>
                                                        </div>
                                                        <input type="text" id="search-query" class="form-control text-center" name="search_query" placeholder="Enter your address/postcode to order" value="">
                                                        <div class="input-group-append">
                                                            <button type="button" class="btn btn-light" data-control="search-local" data-replace-loading="fa fa-spinner fa-spin"><i class="fa fa-check"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!--ASAP y direccion-->

                                    <!--Informacion del restaurante-->
                                    <div class="panel panel-local">
                                        <div class="panel-body">
                                            <div class="row boxes">
                                                <div class="box-one col-sm-6">
                                                    <dl class="no-spacing">
                                                        <dd><h1 class="h3">TastyIgniter</h1></dd>
                                                        <dd class="text-muted">
                                                            <div class="rating rating-sm">
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star-half-o"></span>
                                                                <span class="fa fa-star-o"></span>
                                                                <span class="small">()</span>
                                                            </div>
                                                        </dd>
                                                        <dd>
                                                            <span class="text-muted">345 Lewisham Road, London SE13 7AB, United Kingdom</span>
                                                        </dd>
                                                    </dl>                    </div>
                                                <div class="box-divider d-block d-sm-none"></div>
                                                <div class="box-two col-sm-6">
                                                    <dl class="no-spacing">
                                                        <dt><span class="text-success">We are open</span></dt>

                                                        <dd>
                                                            <span class="fa fa-clock"></span>&nbsp;&nbsp;
                                                            <span>24 hours, 7 days.</span>
                                                        </dd>

                                                        <dd class="text-muted">
                                                            Delivery and pick-up available            </dd>
                                                        <dd class="text-muted">
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                    
                                    <!--Opcion de hacer login-->
                                    <div class="card my-1">
                                        <div class="card-body">
                                            Already have an account? <a href="ControladorLogin?accion=login_show">Login Here</a>
                                        </div>
                                    </div>
                                    <!---->
                                    
                                    <!--DATOS PARA EL ENVIO-->
                                    <div class="card">
                                        <div class="card-body">
                                            <div data-control="checkout" data-choose-payment-handler="checkout::onChoosePayment" data-partial="checkoutForm">
                                                <form method="POST" action="ControladorCompra" >
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="first-name">First Name</label>
                                                                <input type="text" name="first_name" id="first-name" class="form-control" value="">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="last-name">Last Name</label>
                                                                <input type="text" name="last_name" id="last-name" class="form-control" value="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="email">Email</label>
                                                                <input type="text" name="email" id="email" class="form-control" value="">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="telephone">Telephone</label>
                                                                <input type="text" name="telephone" id="telephone" class="form-control" value="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="">Delivering to...</label>
                                                        <div class="input-group">
                                                            <select class="form-control" name="address_id">
                                                                <option value="0">Enter a new or an existing delivery address.</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="mt-3">
                                                        <input type="hidden" name="address[address_id]" value="">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label for="">Address 1</label>
                                                                    <input type="text" name="address[address_1]" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label for="">Address 2</label>
                                                                    <input type="text" name="address[address_2]" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label for="">City</label>
                                                                    <input type="text" name="address[city]" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label for="">State</label>
                                                                    <input type="text" name="address[state]" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label for="">Postcode</label>
                                                                    <input type="text" name="address[postcode]" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div data-partial="checkoutPayments">
                                                        <div class="row">
                                                            <div class="col-sm-8">
                                                                <input type="hidden" name="payment" value="">
                                                                <div class="form-group">
                                                                    <label for="">Payment Method</label><br>
                                                                    <div class="list-group">
                                                                        <div class="list-group-item" data-checkout-control="choose-payment" data-payment-code="cod">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="payment-cod" class="custom-control-input" name="payment" value="cod" autocomplete="off">
                                                                                <label class="custom-control-label d-block" for="payment-cod">Cash On Delivery</label>
                                                                                <p class="hide small font-weight-normal mb-0">
                                                                                    Accept cash on delivery during checkout                                    </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="list-group-item" data-checkout-control="choose-payment" data-payment-code="paypalexpress">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="payment-paypalexpress" class="custom-control-input" name="payment" value="paypalexpress" autocomplete="off">
                                                                                <label class="custom-control-label d-block" for="payment-paypalexpress">PayPal Express</label>
                                                                                <p class="hide small font-weight-normal mb-0">
                                                                                    Allows your customers to make payment using PayPal                                    </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="list-group-item" data-checkout-control="choose-payment" data-payment-code="stripe">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="payment-stripe" class="custom-control-input" name="payment" value="stripe" autocomplete="off">
                                                                                <label class="custom-control-label d-block" for="payment-stripe">Stripe Payment</label>
                                                                                <p class="hide small font-weight-normal mb-0">
                                                                                    Accept credit card payments using Stripe                                    </p>
                                                                            </div>
                                                                            <div id="stripePaymentForm" class="payment-form hide w-100" data-publishable-key="" data-card-selector="#stripe-card-element" data-error-selector="#stripe-card-errors" data-trigger="[type=radio][name=payment]" data-trigger-action="show" data-trigger-condition="value[stripe]" data-trigger-closest-parent="form">
                                                                                <input type="hidden" name="stripe_payment_method" value="">

                                                                                <div class="form-group mt-2">
                                                                                    <label for="stripe-card-element">
                                                                                        Credit or debit card
                                                                                    </label>
                                                                                    <div id="stripe-card-element">
                                                                                        <!-- A Stripe Element will be inserted here. -->
                                                                                    </div>

                                                                                    <!-- Used to display form errors. -->
                                                                                    <div id="stripe-card-errors" class="text-danger" role="alert"></div>
                                                                                </div>
                                                                            </div>                        </div>
                                                                        <div class="list-group-item" data-checkout-control="choose-payment" data-payment-code="mollie">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="payment-mollie" class="custom-control-input" name="payment" value="mollie" autocomplete="off">
                                                                                <label class="custom-control-label d-block" for="payment-mollie">Mollie Payment</label>
                                                                                <p class="hide small font-weight-normal mb-0">
                                                                                    Accept credit card payments using Mollie API                                    </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="list-group-item" data-checkout-control="choose-payment" data-payment-code="square">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="payment-square" class="custom-control-input" name="payment" value="square" autocomplete="off">
                                                                                <label class="custom-control-label d-block" for="payment-square">Square Payment</label>
                                                                                <p class="hide small font-weight-normal mb-0">
                                                                                    Accept credit card payments using Square                                    </p>
                                                                            </div>
                                                                            <div id="squarePaymentForm" class="payment-form hide" data-application-id="" data-location-id="" data-error-selector="#square-card-errors" data-trigger="[type=radio][name=payment]" data-trigger-action="show" data-trigger-condition="value[square]" data-trigger-closest-parent="form">
                                                                                <div class="square-ccbox mt-3">
                                                                                    <input type="hidden" name="square_card_nonce" value="">
                                                                                    <input type="hidden" name="square_card_token" value="">

                                                                                    <div class="form-group">
                                                                                        <div id="sq-card-number"></div>
                                                                                        <div class="row no-gutters mt-1">
                                                                                            <div class="col-sm-4 pr-1">
                                                                                                <div id="sq-expiration-date"></div>
                                                                                            </div>
                                                                                            <div class="col-sm-4 pr-1">
                                                                                                <div id="sq-cvv"></div>
                                                                                            </div>
                                                                                            <div class="col-sm-4">
                                                                                                <div id="sq-postal-code"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div id="square-card-errors" class="text-danger"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="comment">Add Comments</label>
                                                        <textarea name="comment" id="comment" rows="3" class="form-control"></textarea>
                                                    </div>

                                                </form>
                                            </div>                
                                        </div>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                        </div>
                        
                        <!--CARRITO-->
                        <div class="col-sm-4">
                            <div class="affix-cart d-none d-sm-block affix-top" data-control="cart-box" data-load-item-handler="cartBox::onLoadItemPopup" data-update-item-handler="cartBox::onUpdateCart" data-apply-coupon-handler="cartBox::onApplyCoupon" data-change-order-type-handler="cartBox::onChangeOrderType" data-remove-item-handler="cartBox::onRemoveItem" data-remove-condition-handler="cartBox::onRemoveCondition" style="width: 350px;">
                                <div id="cart-box" class="module-box">
                                    <div class="panel panel-cart">
                                        <div class="panel-body">
                                            <div id="cart-control">
                                                <div class="btn-group btn-group-toggle w-100 text-center order-type" data-toggle="buttons">
                                                    <label class="btn btn-light active">
                                                        <input type="radio" name="order_type" data-cart-toggle="order-type" value="delivery" checked="checked">&nbsp;&nbsp;
                                                        <strong>Delivery</strong>
                                                        <span class="small center-block">
                                                            in 15 min                                            </span>
                                                    </label>
                                                    <label class="btn btn-light">
                                                        <input type="radio" name="order_type" data-cart-toggle="order-type" value="collection">&nbsp;&nbsp;
                                                        <strong>Pick-up</strong>
                                                        <span class="small center-block">
                                                            in 15 min                                            </span>
                                                    </label>
                                                </div>
                                                <p class="text-muted text-center">
                                                    No Min. Order Amount        </p>
                                            </div>

                                            <!--CARRITO-->
                                            <div id="cart-items">
                                            </div>

                                            <!--CUPONES-->
                                            <div id="cart-coupon">
                                                <form id="coupon-form" method="POST" role="form" data-request="cartBox::onApplyCoupon">
                                                    <div class="cart-coupon">
                                                        <div class="input-group">
                                                            <input type="text" name="code" class="form-control" value="" placeholder="Enter coupon code">
                                                            <span class="input-group-append">
                                                                <button type="submit" class="btn btn-light" data-replace-loading="fa fa-spinner fa-spin" title="Apply Coupon"><i class="fa fa-check"></i></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                            <!--TOTALES-->
                                            <div id="cart-totals">
                                            </div>

                                            <!--CHECKOUT-->
                                            <div id="cart-buttons" class="mt-3">
                                                <button class="checkout-btn btn btn-primary  btn-block btn-lg" data-attach-loading="disabled" data-checkout-control="confirm-checkout" data-request-form="#checkout-form">Confirm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="cart-mobile-buttons" class="mt-3 d-block d-sm-none">
                                <button class="checkout-btn btn btn-primary  btn-block btn-lg" data-attach-loading="disabled" data-checkout-control="confirm-checkout" data-request-form="#checkout-form">Confirm</button>
                            </div>        
                        </div>
                        <!---->

                    </div>
                </div>
            </div>
        </main>

    </body>
</html>
