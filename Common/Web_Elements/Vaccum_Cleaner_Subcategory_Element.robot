*** Settings ***
Resource          ../Test_Data/Test_Data.robot

*** Variables ***
${MI_ROBOT}               //div[contains(@class, 'category_product_col_new')]//div[@class='itemdesc']/p[contains(., '${vac_brand}')]
${VAC_CLEANER_WEBPAGE_TITLE}      //title[contains(., 'Vacuum Cleaner')]
${VAC_CLEANER_TITLE_TEXT}         //span[contains(@class, 'title') and contains(., 'Vacuum Cleaner')]
${NO_OF_SEARCH_RESULT_FOUND}      //span[contains(@class, 'title') and contains(., 'Vacuum Cleaner')]/h6[contains(., 'Item Found In Vacuum Cleaner')]
${VAC_CLEANER_BREADCRUMB}         //ul[@class='breadcrumb arob-breadcrumb']/li[contains(., 'Vacuum Cleaner')]
${PRODUCT_CARD}                 //div[contains(@class, 'category_product_col_new')]
${VAC_CLEANER_PRODUCT_CARD}       //div[contains(@class, 'category_product_col_new')]//div[@class='itemdesc' and contains(., 'Vacuum Cleaner')]
${NON_VAC_CLEANER_PRODUCT_CARD}       //div[contains(@class, 'category_product_col_new')]//div[@class='itemdesc' and contains(., 'Television')]



