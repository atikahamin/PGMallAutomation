*** Variables ***
${VIEW_SHOPPING_CART_BTN}                 //*[@id="check-out"]
${CART_FORM}                    //form[@id="cart-form"]
${STORE_CBOX}                   //input[@type='checkbox' and contains(@id, "store-check")]/following-sibling::div[@class='control_indicator']
${SPINNER}                      //div[@id="loading-form"]
${CHECKOUT_BTN}             //input[@class="btn-checkout"]
${CHECKOUT_PRICE}                //span[@id='merchandise-subtotal']
${SIDE_CART_MENU}           //li[@id="showside-cart"]/pgmall-icon
${CART_CHECKOUT_BTN}            //div[@id="check-out"]
${CART_DELETE_ITEM_BTN}         //button[@class='btn-delete']
${SHOPPING_CART_IS_EMPTY_NOTI}      //pgmall-icon[@class='icon-cart']/../following-sibling::div[contains(., 'Your shopping cart is empty')]