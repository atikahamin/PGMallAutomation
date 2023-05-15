*** Settings ***
Library           BuiltIn
Library           SeleniumLibrary
Library           String
Library           OperatingSystem
Library           Process
Library           Collections
Library           DateTime
Resource          generic_variables.robot
Resource          ../Test_Data/Test_Data.robot
Resource          ../Web_Elements/Homepage_Element.robot
Resource          ../Web_Elements/Login_Page_Element.robot
Resource          ../Web_Elements/Checkout_Page_Element.robot
Resource          ../Web_Elements/Vaccum_Cleaner_Subcategory_Element.robot
Resource          ../../Stories/PGMALL/Keywords.robot
Resource          ../Web_Elements/Item_Details_Page_Element.robot
Resource          ../Web_Elements/Cart_Page_Element.robot
Resource          Generic_Keyword_Library.robot


*** Keywords ***

Navigate to PGmall Webpage

    open browser        ${Url}        ${browser}         options=add_experimental_option("detach", True)
    set window size     1920        1080
    maximize browser window

Close Ads Popup
    wait until element is visible           ${ADS_POPUP_CLOSE_BTN}          ${timeout}
    click element                           ${DO_NOT_SHOW_AGAIN_CBOX}
    Click Element                           ${ADS_POPUP_CLOSE_BTN}
    wait until element is not visible       ${ADS_POPUP}
    page should contain element             ${HPAGE_HEADER}
    page should contain element             ${HPAGE_BODY}
    page should contain element             ${HPAGE_FOOTER}
    capture page screenshot


Login To PGmall
    Navigate to PGmall Webpage
    Close Ads Popup
    Change Language to English
    Login To PGmall Account

Login To PGmall Account
    Click Element       ${LOGIN_LINK}
    wait until element is visible    ${LOGIN_PAGE_HEADER}
    input text    ${USERNAME_TEXTFIELD}     ${usernameData}
    input text    ${PASSWORD_TEXTFIELD}     ${pwud}
    capture page screenshot
    click element    ${SUBMIT_BTN}
    wait until element is visible    ${ACCOUNT_NAME_LOGIN}      ${timeout}
    capture page screenshot
    Click Element    ${LOGGEDIN_PROFILE}
    wait until element is visible       ${SLIDE_WINDOW_ACCOUNT_NAME}       ${timeout}
    click element    ${CLOSE_SIDE_WINDOW}
    wait until element is not visible     ${SLIDE_WINDOW_ACCOUNT_NAME}
    ${cartnotempty} =       run keyword and return status    page should contain element        ${CART_IS_EMPTY}
    run keyword if      ${cartnotempty}     Clear cart

Change Language to English
    select from list by value    ${LANGUAGE_DDL}     ${LANGUAGE_ENGLISH}
    wait until element is visible    ${LOGIN_LINK_ENGLISH}      ${timeout}
