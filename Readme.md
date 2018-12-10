This is the repro for https://github.com/NuGet/Home/issues/6283

The problem is when adding the class library nuget package to the console application. These two 
would be in different solutions normally, and are only included here together for an easier repro.


1) Open solution
2) Build as Release / Any CPU
3) Execute `.\BuildLocalPackage.ps1` to produce the class libary package
4) Using the NugetPM UI, install the newly creaded class library package into the console app. 

Expected: The package is installed, the TT does/does not execute, no errors are present. 

Actual: The package is installed, the TT is executed, errors are present. 

See `"after including the class library nuget package into the console app.png"` for depiction of the errors