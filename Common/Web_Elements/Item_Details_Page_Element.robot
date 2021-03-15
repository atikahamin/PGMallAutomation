*** Settings ***
Resource          ../Test_Data/Test_Data.robot

*** Variables ***
${DETAILS_PAGE_HEADER}          //h3[@id='prod_name' and contains(., '${vac_brand}')]
${DETAILS_PAGE_BREADCRUMB}      //ul[@class='breadcrumb arob-breadcrumb']/li[contains(., '${vac_brand}')]
${DETAILS_PRICE}                //b[@class='p-price']
${GALLERY_PHOTO}                //div[@class='small-img']
${PREVIEW_PHOTO}                //div[@class='show-zoom']/div[@class="img-middled"]/img
${PREVIEW_ZOOM_BOX}             //div[@class='show-zoom']//div[@class='img-middled']/following-sibling::div[not(contains(@style, 'display: none;'))]/img[@id='big-img']
${NEXT_PHOTO_GALLERY}           //*[@id='next-img']
${QUANTITY}                     //*[@id='qty_input']
${ADD_QUANTITY}                 //button[@id="plus-btn"]
${QUANTITY_ADDED}               //span[contains(@class, 'next-input-single')]/input[@value='${QUANTITYAIRBOT}']
${STORE_OVERVIEW}               //*[@id='store-overview-div']
${PRODUCT_SECTION}              //div[@id='product']
${PRODUCT_DETAILS_SECTION}      //*[@id='product-spec-div']
${PRODUCT_SPECIFICATION_HEADER}   //h3[contains(., 'Product Specification')]
${PRODUCT_DESC_SECTION}         //*[@id='product-desc-div']
${PRODUCT_DESCRIPTION_HEADER}   //h3[contains(., 'Product Description')]
${PRODUCT_REVIEW_SECTION}       //*[@id='product-review-div']
${PRODUCT_REVIEW_HEADER}        //h3[contains(., 'Product Review')]
${ADD_TO_CART_BTN}              //*[@id='button-cart']
${ADDED_TO_CART_BADGE}          //li[@id='showside-cart']//span[@id="cart-badge" and contains(., '${QUANTITYAIRBOT}')]
${SHOPPING_CART}                //*[@id="hidingside-cart"]
${ADDED_TO_CART_POPUP_WINDOW}   //p[contains(., 'Item has been added to your shopping cart')]
${SHIPPING_FEE}                 //span[contains(., 'Shipping Fee')]
${CHECKOUT_PRICE}                //*[@id="nav-total_payable"]
${PURCHASE_BTN}                 //*[@id="check-out"]