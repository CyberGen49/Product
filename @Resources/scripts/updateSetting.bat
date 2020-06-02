
@echo off
title Updating Settings...

set rmdir=C:\Program Files\Rainmeter
set path=%path%;%rmdir%

if not exist "%rmdir%\rainmeter.exe" goto error

:: %1 = variable name
:: %2 = variable content
:: %3 = skin path
:: %4 = settings skin path
:: %5 = settings file path

window GSize HIDE
window GPos 0 0
::cecho {\n}{0f}Setting variable {07}%1{0f} to {07}%2{0f}...
rainmeter [!SetVariable %1 %2 %3]
rainmeter [!SetVariable %1 %2 %4]
::cecho {\n}{0f}Writing variable {07}%1's{0f} new content to {07}%5{0f}...
rainmeter [!WriteKeyValue Variables %1 %2 %5]
::cecho {\n}{0f}Updating skins...{\n}
rainmeter [!Update %3]
rainmeter [!Update %4]

::pause
exit

:error
cls
color 0f
window Size 100 30
window GPos 50 50
window GSize SHOW

cecho {\n}{04}ERROR:
cecho {\n}{08}Rainmeter.exe doesn't exist in %rmdir%.
cecho {\n}{\n}{07}We're unable to update your settings at this time as we can't find your Rainmeter executable.
cecho {\n}{\n}{07}Please join the Discord server linked on my website, so we can farther assist you.
cecho {\n}{07}Highlight the link and right click to copy.
cecho {\n}{09}https://rainmeter.simplecyber.ml

cecho {\n}{\n}{08}Press any key to exit.
pause > nul