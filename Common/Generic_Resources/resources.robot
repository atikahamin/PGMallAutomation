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
Resource          ../../Stories/Ace/Keywords.robot
Resource          ../Web_Elements/Item_Details_Page_Element.robot
Resource          Generic_Keyword_Library.robot


*** Keywords ***

Navigate to PGmall Webpage
    open browser        ${Url}        ${browser}
    maximize browser window
    wait until element is visible           ${ADS_POPUP}           ${timeout}
    Click Element                           //*[@id="do-not-show-global-modal"]
    Click Element                           ${ADS_POPUP_CLOSE_BTN}
    wait until element is not visible       ${ADS_POPUP}
    page should contain element             ${HPAGE_HEADER}
    page should contain element             ${HPAGE_BODY}
    page should contain element             ${HPAGE_FOOTER}
    capture page screenshot

Login To PGmall
    Navigate to PGmall Webpage
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