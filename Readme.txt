Test Script Structure:
1) Common Folder: 
================
i) Generic_Resources
- Where generic codes, main resource file and generic variables stored.
- Generic_Keyword_Library.robot is the customized keyword created using javascript and can be use globally in the script.
- resources.robot file is where all the files and libraries will be referred to. Check the settings section for all those files.

ii) Test Data:

-store the test data of each test cases.

iii) Web Elements:
-stored web element of each screen.

2) Stories:
==========
-contains the Test_Scenarios.robot where test case is written. Keywords.robot contains the test steps of the script.

3) Reports:
==========
-contains log,report and output file of the test execution, along with the screenshot.


How to Run the test case:
=========================

run command below-

robot -T -d "Reports\Ace\Purchase Item in PGMall" -t "Purchase Item in PGMall" Stories\Ace\Test_Scenarios.robot
