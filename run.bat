echo on
set GITHUB_ACCOUNT=Veta99
set WS_DIR=Workspace
set REPO_NAME=Parsing
if "%JAVA_HOME%" == "" GOTO EXIT_JAVA
ECHO Java installed
if "%M2%" == "" GOTO EXIT_MVN
ECHO Maven installed
CALL git --version > nul 2>&1
if NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
ECHO Git installed
GOTO NEXT
:NEXT
if NOT EXIST C:\%WS_DIR% GOTO NO_Workspace
if EXIST C:\%WS_DIR%\%REPO_NAME% RMDIR /S /Q C:\%WS_DIR%\%REPO_NAME%
CD C:\%WS_DIR%
git clone https://github.com/%GITHUB_ACCOUNT%/%REPO_NAME%.git
CD %REPO_NAME%
ECHO.
ECHO Executing Java programm ...
java -cp C:\%WS_DIR%\%REPO_NAME%\Parsing_DOM_XPath.jar core.DOM_XPath
java -cp C:\%WS_DIR%\%REPO_NAME%\Parsing_DOM.jar core.DOM
java -cp C:\%WS_DIR%\%REPO_NAME%\Parsing_SAX.jar core.SAX
java -cp C:\%WS_DIR%\%REPO_NAME%\Parsing_StAX.jar core.StAX
GOTO END
:EXIT_JAVA
ECHO No Java installed
GOTO END
:EXIT_MVN
ECHO No Maven installed
GOTO END
:EXIT_GIT
ECHO No Git installed
GOTO END
:NO_Workspace
ECHO %WS_DIR% is not exists
GOTO END
:END
cd..
cd..


