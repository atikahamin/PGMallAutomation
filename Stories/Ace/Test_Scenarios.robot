*** Settings ***
Documentation     Order Item in PG Mall Webpage
...               13 March 2021
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***
Purchase Item in PGMall
    [Documentation]    To verify user able to purchase item in PGmall

    Given Login To PGMall
    When User Hover On Category Menu
    Then User Choose Robot Vacuum Sub Category
    Given User Navigated to Robot Vacuum Sub Category
    When All Search Result Is Related to Robot Vacuum Model
         User Choose One Item From Search Result
    Then Details Item Page Displayed
    Given Item Details Page Showing Correct Item
    When User Add Quantity
         User Add Item To Cart
    Then Verify Item Is Added to the Cart
    Given User Click Checkout Button
    When User Navigated to Checkout Page
    Then Verify Correct Item Is Checked Out

     [Teardown]    Close Browser