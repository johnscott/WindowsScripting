REM Create a new directory defined in the %directoryDestination% variable
@echo off & setlocal ENABLEEXTENSIONS
set directoryDestination=c:\temp
IF NOT EXIST %directoryDestination% GOTO NOWINDIR


:createFolderWithDate
call :GetDate y m d
echo/Today is: %y%-%m%-%d%
mkdir "%directoryDestination%\%m%-%d%-%y%"
REM pause

goto :EOF

REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 :GetDate yy mm dd
REM ::GetDate
REM :: By:   Ritchie Lawrence, 2002-06-15. Version 1.0
REM ::
REM :: Func: Loads local system date components into args 1 to 3.
REM ::       For NT4/2000/XP/2003.
REM ::
REM :: Args: %1 var to receive year, 4 digits (by ref)
REM ::       %2 var to receive month, 2 digits, 01 to 12 (by ref)
REM ::       %3 Var to receive day of month, 2 digits, 01 to 31 (by ref)
REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
set t=2&if "%date%z" LSS "A" set t=1
for /f "skip=1 tokens=2-4 delims=(-)" %%a in ('echo/^|date') do (
  for /f "tokens=%t%-4 delims=.-/ " %%d in ('date/t') do (
    set %%a=%%d&set %%b=%%e&set %%c=%%f))
endlocal&set %1=%yy%&set %2=%mm%&set %3=%dd%&goto :EOF
REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 	

:NOWINDIR
mkdir %directoryDestination%
goto :createFolderWithDate