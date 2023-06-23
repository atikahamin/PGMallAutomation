*** Settings ***
Documentation     Order Item in PG Mall Webpage
...               13 March 2021
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***
TC_1-Purchase_Item_in_PGMall
    [Documentation]    To verify user able to purchase item in PGmall
    ...                 1. User login
    ...                 2. Search for Vacuum
    ...                 3. Add 2 vacuum into cart
    ...                 4. Calculate subtotal price(item+shipment)
    ...                 5. Verify calculated subtotal matched the displayed subtotal in checkout page

    Given Login To PGMall
          Login To PGmall Account       ${usernameData}     ${pwud}
    When User Hover On Category Menu
    Then User Choose Robot Vacuum Sub Category
    Given User Navigated to Robot Vacuum Sub Category
    When All Search Result Is Related to Robot Vacuum Model
         User Choose One Item From Search Result        ${MI_ROBOT}
    Then Details Item Page Displayed        ${vac_brand}
    Given Item Details Page Showing Correct Item
    When User Add Quantity
         User Add Item To Cart
    Then Verify Item Is Added to the Cart
    Given User Click Checkout Button
          User navigated to Cart Page
    When User Navigated to Checkout Page
    Then Verify Correct Item Is Checked Out
     [Teardown]    Close Browser



