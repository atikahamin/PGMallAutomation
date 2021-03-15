*** Variables ***
${name_user}            ATIKAH MOHD AMIN
${HPAGE_HEADER}        //*[@id="cat-menu-nav"]
${HPAGE_BODY}           //h1[contains(., 'Malaysia Leading Online Shopping Marketplace')]
${HPAGE_FOOTER}         //*[@id='footer']
${ADS_POPUP}            //div[@class='modal-content-ads']
${ADS_POPUP_CLOSE_BTN}  //div[@class='modal-content-ads']//button[contains(@class, 'close_btn')]
${LOGIN_LINK}           //*[@id='showside-user']
${ACCOUNT_NAME_LOGIN}   //div[@id='name-left' and contains(., '${name_user}')]
${LOGGEDIN_PROFILE}     //*[@id="showside-profile"]
${PGMALL_TOGGLE_BTN}    //button[@id="toggle"]
${L1_LIST_HOME_APP}     //li[@class='catlist']//span[text()='Home Appliances']
${L2_LIST_HOUSE_KEEPING}        //li[@class='subcatlist']//span[text()='House Keeping']
${L3_LIST_VAC_CLEANER}              //li[@class='smallcatlist']//span[text()='Vacuum Cleaner']



