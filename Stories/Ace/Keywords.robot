*** Settings ***
Library           String
Library           Collections
Resource          ../../Common/Generic_Resources/resources.robot

*** Keywords ***
User Hover On Category Menu
    Click Element    ${LOGGEDIN_PROFILE}
    wait until element is not visible       ${ACCOUNT_NAME_LOGIN}       ${timeout}
    Click Element    ${PGMALL_TOGGLE_BTN}
    mouse over    ${L1_LIST_HOME_APP}
    wait until element is visible    ${L2_LIST_HOUSE_KEEPING}   ${timeout}
    capture page screenshot
    mouse over      ${L2_LIST_HOUSE_KEEPING}
    wait until element is visible    ${L3_LIST_VAC_CLEANER}
    capture page screenshot

User Choose Robot Vacuum Sub Category
    click element       ${L3_LIST_VAC_CLEANER} 
    wait until page contains element        ${VAC_CLEANER_WEBPAGE_TITLE}  ${timeout}

User Navigated to Robot Vacuum Sub Category
    wait until page contains element        ${VAC_CLEANER_WEBPAGE_TITLE}  ${timeout}
    wait until element is visible           ${VAC_CLEANER_TITLE_TEXT}
    page should contain element             ${NO_OF_SEARCH_RESULT_FOUND}
    page should contain element              ${VAC_CLEANER_BREADCRUMB}

All Search Result Is Related to Robot Vacuum Model
    page should contain element    ${PRODUCT_CARD}
    page should contain element    ${VAC_CLEANER_PRODUCT_CARD}
    page should not contain element     ${NON_VAC_CLEANER_PRODUCT_CARD}
    capture page screenshot

User Choose One Item From Search Result
    click element       ${AIRBOT}

Details Item Page Displayed
    wait until element is visible       ${DETAILS_PAGE_HEADER}     ${timeout}
    page should contain element         ${DETAILS_PAGE_BREADCRUMB}


Item Details Page Showing Correct Item
     page should contain element         ${DETAILS_PRICE}
    ${pricetext} =      get text        ${DETAILS_PRICE}
    ${strippedprice} =  strip string    ${pricetext}
    ${numbersprice} =   get substring    ${strippedprice}   2
    set suite variable    ${ITEM_PRICE}      ${numbersprice}
    page should contain element    ${ADD_TO_CART_BTN}
    mouse over    ${PREVIEW_PHOTO}
    wait until element is visible    ${PREVIEW_ZOOM_BOX}
    capture page screenshot
    click element       ${NEXT_PHOTO_GALLERY}
    mouse over    ${PREVIEW_PHOTO}
    wait until element is visible    ${PREVIEW_ZOOM_BOX}
    Click Element        ${NEXT_PHOTO_GALLERY}
    capture page screenshot
    Scroll to Center    ${STORE_OVERVIEW}
    wait until element is visible    ${STORE_OVERVIEW}      ${timeout}
    Wait To Scroll
    capture page screenshot
    Scroll to Center    ${PRODUCT_SPECIFICATION_HEADER}
    wait until element is visible       ${PRODUCT_DETAILS_SECTION}      ${timeout}
    Wait To Scroll
    capture page screenshot
    Scroll to Center         ${PRODUCT_DESCRIPTION_HEADER}
    wait until element is visible    ${PRODUCT_DESC_SECTION}        ${timeout}
    Wait To Scroll
    capture page screenshot
    Scroll to Center        ${PRODUCT_REVIEW_HEADER}
    wait until element is visible    ${PRODUCT_REVIEW_HEADER}         ${timeout}
    Wait To Scroll
    capture page screenshot


User Add Quantity
    Scroll to Top                    ${DETAILS_PAGE_HEADER}
    Wait To Scroll
    wait until element is visible    ${QUANTITY}      ${timeout}
    page should contain element    ${QUANTITY}
    capture page screenshot
    Click Element                  ${ADD_QUANTITY}
    capture page screenshot
    ${subtotal} =   evaluate    ${ITEM_PRICE}*${QUANTITYAIRBOT}
    set suite variable    ${CALCULATED_SUBTOTAL}    ${subtotal}

User Add Item To Cart
    click element           ${ADD_TO_CART_BTN}

Verify Item Is Added to the Cart
    wait until element is visible       ${ADDED_TO_CART_POPUP_WINDOW}   ${timeout}
    capture page screenshot
    page should contain element         ${ADDED_TO_CART_BADGE}
    capture page screenshot

User Click Checkout Button
    Click Element               ${ADDED_TO_CART_BADGE}
    wait until element is visible    ${SHOPPING_CART}       ${timeout}
    wait until page contains element    ${CHECKOUT_PRICE}   ${timeout}
    ${totalpricetext} =      get text        ${CHECKOUT_PRICE}
    ${strippedtotalprice} =  strip string    ${totalpricetext}
    ${numberstotalprice} =   get substring    ${strippedtotalprice}   2
    set suite variable    ${SUBTOTAL_PRICE}     ${numberstotalprice}
    should be equal as numbers       ${CALCULATED_SUBTOTAL}       ${SUBTOTAL_PRICE}   precision=1
    click element                ${PURCHASE_BTN}

User Navigated to Checkout Page
    wait until element is visible      ${CONFIRM_ORDER_BTN}       ${timeout}

Verify Correct Item Is Checked Out
    page should contain element        ${CHECKOUT_ADDRESS}
    page should contain element        ${ORDER_SUMMARY_SECTION}
    page should contain element        ${SHIPPING_FEE}
    page should contain element        ${SUBTOTAL}\[contains(., '${SUBTOTAL_PRICE}')]
    ${shippingfeeprice} =   get text   ${SHIPPING_FEE}
    ${subship} =    get substring    ${shippingfeeprice}      2
    set suite variable    ${TOTAL_SHIPPING_FEE}      ${subship}
    ${subtotalandshipping} =   evaluate    ${SUBTOTAL_PRICE}+${TOTAL_SHIPPING_FEE}
    set suite variable    ${CALCULATED_PAYABLE}    ${subtotalandshipping}
    page should contain element        ${BALANCE_PAYABLE_PRICE}
    ${balpayable} =     get text        ${BALANCE_PAYABLE_PRICE}
    ${balpayableprice} =   get substring    ${balpayable}  2
    ${removecommabalpayableprice} =    remove string      ${balpayableprice}    ,
    set suite variable    ${BALANCE_PAYABLE_AMOUNT}     ${removecommabalpayableprice}
    should be equal as numbers       ${CALCULATED_PAYABLE}         ${BALANCE_PAYABLE_AMOUNT}     precision=1
    page should contain element        ${SHIPPING_FEE}
    page should contain element        ${ITEM_QUANTITY}
    page should contain element        ${COUPON}
    page should contain element        ${PAYMENT}
    page should contain element        ${WALLET_PAYMENT}
    capture page screenshot    

