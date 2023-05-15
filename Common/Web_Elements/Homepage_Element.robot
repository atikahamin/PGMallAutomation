*** Variables ***
${name_user}            ATIKAH MOHD AMIN
${HPAGE_HEADER}         //div[@class='top-bar']
${HPAGE_BODY}           //h1[contains(., 'Malaysia Leading Online Shopping Marketplace')]
${HPAGE_FOOTER}         //*[@id='footer']
${ADS_POPUP}            //div[@class='modal-content-ads']
${ADS_POPUP_CLOSE_BTN}  //button[@class='global-modal-close modal_close_btn']
${LOGIN_LINK}           //*[@id='showside-user']
${LOGIN_LINK_ENGLISH}   //li/a[contains(., 'Login')]
${ACCOUNT_NAME_LOGIN}   //li[@class='cname']//a[contains(., '${name_user}')]
${SLIDE_WINDOW_ACCOUNT_NAME}    //div[@id='name-left' and contains(., '${name_user}')]
${LOGGEDIN_PROFILE}     //*[@id="showside-profile"]
${PGMALL_TOGGLE_BTN}    //button[@id="toggle"]
${L1_LIST_HOME_APP}     //li[@class='catlist']//span[text()='Home Appliances']
${L2_LIST_HOUSE_KEEPING}        //li[@class='subcatlist']//span[text()='House Keeping']
${L3_LIST_VAC_CLEANER}              //li[@class='smallcatlist']//span[text()='Vacuum Cleaner']
${DO_NOT_SHOW_AGAIN_CBOX}       do-not-show-global-modal
${CLOSE_SIDE_WINDOW}            gback
${LANGUAGE_DDL}             //form[@id='form-language']/select[@id='dropdown']
${CART_IS_EMPTY}            //span[@id="cart-badge"][not(contains(., '0'))]



