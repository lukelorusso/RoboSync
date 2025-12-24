@echo off
title RoboSync (by LukeLorusso)
color 0a
cls
rem --- REMINDER ---
echo ARE YOU SURE YOU HAVE GIVEN ADMIN RIGHTS? If so, you are good to go! :D
pause
cls
rem --- GETTING ARGUMENTS ---
set /A ARG_C=0
for %%x in (%*) do Set /A ARG_C+=1
if %ARG_C%==0 goto getFoldersByInput
if not %ARG_C%==2 (
    echo WARNING! If you want to use arguments, you have to specify 2 of them: ORIGIN and DESTINATION
	echo.
    goto getFoldersByInput
)
set ROBO_ORIGIN_PATH=%1
set ROBO_DESTIN_PATH=%2
goto theJob
rem --- INPUT ORIGIN FOLDER ---
:getFoldersByInput
echo Specify the absolute or relative path of an EXISTENT ORIGIN folder (without quotes)
echo e.g.:
echo "D:"
echo "myGoodFiles\origin"
set /p ROBO_ORIGIN_PATH=: 
if "%ROBO_ORIGIN_PATH%"=="" goto errorPath
echo.
rem --- INPUT DESTINATION FOLDER ---
echo Specify the absolute or relative path of a DESTINATION folder (without quotes)
echo e.g.:
echo "Y:"
echo "myGoodFiles\backup"
set /p ROBO_DESTIN_PATH=: 
if "%ROBO_DESTIN_PATH%"=="" goto errorPath
if %ROBO_ORIGIN_PATH%==%ROBO_DESTIN_PATH% goto errorPath
echo.
rem --- THE JOB ---
:theJob
color 0c
cls
echo WARNING! The DESTINATION folder at this path:
echo [%ROBO_DESTIN_PATH%]
echo.
echo will become an EXACT COPY of the ORIGINAL folder:
echo [%ROBO_ORIGIN_PATH%]
echo.
echo ALL FILES in the destination folder which are NOT EXISTING in the origin folder WILL BE DESTROYED!
echo If the same filename exists in both folders, THE DESTINATION FILE WILL BE OVERRIDDEN!
echo If you are not sure, press CTRL+C or just close this session/window to stop the process.
echo.
echo Are you REALLY SURE you want to start the ROBOCOPY?
pause
echo.
echo ---
title RoboSync: Working...
color 0a
echo Copying:
robocopy %ROBO_ORIGIN_PATH% %ROBO_DESTIN_PATH% /MIR /ETA /B
color 0e
title RoboSync: Completed
echo.
echo I did my job! Check eventual error messages before.
echo Bye! ;)
echo.
goto theEnd
:errorPath
echo.
echo ---
color 0e
title TRY AGAIN! -.-"
echo CAN'T CONTINUE: you skipped the origin or destination folder, or they are THE SAME PATH!
echo.
:theEnd
pause
color 0a
color
