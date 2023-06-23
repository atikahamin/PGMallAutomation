*** Settings ***
Library           String
Library           Collections
Library           SeleniumLibrary
Resource          ../Common/Generic_Resources/resources.robot

*** Keywords ***
User Hover On Category Menu
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
    [Arguments]     ${item}
    Scroll to Center    ${item}
    sleep    3s
    wait until element is visible     ${item}      8s
    click element        ${item}

Details Item Page Displayed
    [Arguments]     ${name}
    wait until element is visible       ${DETAILS_PAGE_HEADER}\[contains(., '${name}')]     ${timeout}
    page should contain element         ${DETAILS_PAGE_BREADCRUMB}\/li[contains(., '${name}')]


Item Details Page Showing Correct Item
     page should contain element         ${DETAILS_PRICE}
    ${pricetext} =      get text        ${DETAILS_PRICE}
    ${strippedprice} =  strip string    ${pricetext}
    ${numbersprice1} =   get substring    ${strippedprice}   2
    ${numbersprice2} =   remove string    ${numbersprice1}   ,
    ${numbersprice} =   convert to number     ${numbersprice2}
    set test variable    ${ITEM_PRICE}      ${numbersprice}
    page should contain element    ${ADD_TO_CART_BTN}
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
    Click Element By Xpath                ${ADD_QUANTITY}
    capture page screenshot
    ${subtotal} =   evaluate    ${ITEM_PRICE}*${QUANTITYAIRBOT}
    set test variable    ${CALCULATED_SUBTOTAL}    ${subtotal}

User Add Item To Cart
    click element by xpath          ${ADD_TO_CART_BTN}

Verify Item Is Added to the Cart
    wait until element is visible       ${ADDED_TO_CART_POPUP_WINDOW}   ${timeout}
    capture page screenshot
    page should contain element         ${ADDED_TO_CART_BADGE}
    capture page screenshot

User Click Checkout Button
    Click Element               ${ADDED_TO_CART_BADGE}
    wait until element is visible    ${VIEW_SHOPPING_CART_BTN}    ${timeout}
    capture page screenshot
    click element                ${VIEW_SHOPPING_CART_BTN}

User Navigated to Checkout Page
    wait until element is visible     ${CHECKOUT_ADDRESS}     ${timeout}

Verify Correct Item Is Checked Out
    page should contain element        ${CHECKOUT_ADDRESS}
    page should contain element        ${ORDER_SUMMARY_SECTION}
    page should contain element        ${SHIPPING_FEE}
    page should contain element        ${SUBTOTAL}
    ${shippingfeeprice} =   get text   ${SHIPPING_FEE}
    ${subship1} =    get substring    ${shippingfeeprice}      2
    ${subship} =    strip string        ${subship1}
    set test variable    ${TOTAL_SHIPPING_FEE}      ${subship}
    ${subtotalandshipping} =   evaluate    ${SUBTOTAL_PRICE}+${TOTAL_SHIPPING_FEE}
    ${convtostringsubtotal} =       convert to string    ${subtotalandshipping}
    ${stripsubtotal} =  strip string    ${convtostringsubtotal}
    set test variable    ${CALCULATED_SUBTOTAL}    ${stripsubtotal}
    ${subtotaldisplayed} =     get text        ${DISPLAYED_SUBTOTAL}
    ${removeRMsubtotaldisplayed} =   get substring    ${subtotaldisplayed}  2
    ${removecommasubtotaldisplayed} =    remove string      ${removeRMsubtotaldisplayed}    ,
    set test variable    ${SUBTOTAL_DISPLAYED}     ${removecommasubtotaldisplayed}
    should be equal as numbers       ${CALCULATED_SUBTOTAL}         ${SUBTOTAL_DISPLAYED}     precision=2
    page should contain element        ${SHIPPING_FEE}
    page should contain element        ${ITEM_QUANTITY}
    page should contain element        ${COUPON}
    scroll to element    ${WALLET_PAYMENT}
    wait until element is visible       ${WALLET_PAYMENT}   ${timeout}
    sleep    3s
    capture page screenshot
    scroll to center    ${PAYMENT}
    wait until element is visible        ${PAYMENT}     ${timeout}
    sleep   3s
    capture page screenshot

User navigated to Cart Page
    wait until element is visible       ${CART_FORM}    ${timeout}
    click element                  ${STORE_CBOX}
#      wait until element is visible    ${SPINNER}        ${timeout}
    wait until element is not visible       ${SPINNER}
    wait until element is enabled    ${CHECKOUT_BTN}        ${timeout}
     ${totalpricetext} =      get text        ${CHECKOUT_PRICE}
    ${strippedtotalprice} =  strip string    ${totalpricetext}
    ${numberstotalprice} =   get substring    ${strippedtotalprice}   2
    ${removecommatotalprice} =    remove string      ${numberstotalprice}    ,
    set test variable    ${SUBTOTAL_PRICE}     ${removecommatotalprice}
    click element        ${CHECKOUT_BTN}

Clear cart
    click element    ${SIDE_CART_MENU}
    wait until element is visible    ${CART_CHECKOUT_BTN}       ${timeout}
    click element    ${CART_CHECKOUT_BTN}
    wait until element is visible     ${CART_DELETE_ITEM_BTN}     ${timeout}
    click element       ${CART_DELETE_ITEM_BTN}
    wait until element is not visible       ${SPINNER}      ${timeout}
    wait until element is visible    ${SHOPPING_CART_IS_EMPTY_NOTI}      ${timeout}
    capture page screenshot



