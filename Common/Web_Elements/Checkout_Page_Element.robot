*** Settings ***
Resource          ../Test_Data/Test_Data.robot
*** Variables ***
${CONFIRM_ORDER_BTN}             //*[@id="checkout-btn"]
${CHECKOUT_ADDRESS}             //*[@id='receiver_detail']
${MY_CART_SECTION}              //div[@class="cart-product-div"]
${EST_DELIVERY_DATE}            //span[text()="Estimated Delivery Date"]
${PRODUCT_NAME}                 //span[@class="checkout-prod-name" and contains(., '${vac_brand}')]
${ORDER_SUMMARY_SECTION}        //*[@id="summary_div"]
${SUBTOTAL}                     //*[@id="checkout_total_price"]
${BALANCE_PAYABLE_PRICE}        //*[@id="checkout_total_payable"]
${SHIPPING_FEE}                 //span[contains(@id, "campaign_shipping")]
${ITEM_QUANTITY}                //input[contains(@id, "qty_input") and @value='2']
${COUPON}                       //*[@id="coupon_div"]
${PAYMENT}                      //*[@id="payment_div"]
${WALLET_PAYMENT}               //h4[contains(., 'Pay via C-Wallet')]