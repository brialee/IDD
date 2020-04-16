# AdminUI

## Project Setup

Just open AdminUI.sln in Visual Studio

## How to run

Compile with IISExpress

## What it does

This is a Web App that connects to an Azure DB that stores timesheets fron Multnomah County caretakers.
The app loads the timesheets from the database and displays them in a table sortable by each element.
The admin/user can then access each timesheet and process them by either approving or rejecting them.


# Unit Tests

To run unit tests: 

1. Open VS
2. Open SolutionsExplorer
3. If you don't see the AdminUITests project, then you need to right click on the Solution 'AdminUI' -> 'Add' -> 'Existing Project' -> Navigate into the AdminUITests folder and select the 'AdminUITest.csproj' file.
4. Now that you have the AdminUITest in the Solution Explorer, click 'Test' in the navbar and 'Run All Tests'.
5. You should have successfully ran all tests. 
