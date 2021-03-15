*** Settings ***

*** Keywords ***
Scroll to Center
    [Arguments]    ${elementXpath3}
    [Documentation]    To scroll to the center of page
    ...   Atikah Mohd Amin
    ...    12 Mac 2021
    Execute Javascript  document.evaluate("${elementXpath3}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView({behavior: 'auto',block: 'center',inline: 'center'});


Click Element By Xpath
    [Arguments]    ${elementXpath2}
    [Documentation]    To click specific element in the page using xpath
    ...   Atikah Mohd Amin
    ...    23 Oct 2020
    Execute Javascript    document.evaluate("${elementXpath2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

Scroll to Top
    [Arguments]    ${elementXpath3}
    [Documentation]    To scroll to the top of page
    ...   Atikah Mohd Amin
    ...    2 Feb 2021
    Execute Javascript  document.evaluate("${elementXpath3}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView({behavior: 'auto',block: 'start',inline: 'start'});

Scroll to Element
    [Arguments]    ${elementXpath3}
    [Documentation]    To input value to specific element in the page using xpath
    ...   Atikah Mohd Amin
    ...    28 Sept 2020
    Execute Javascript  document.evaluate("${elementXpath3}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(); window.scrollBy(0, 600);

Wait To Scroll
    Sleep       5s