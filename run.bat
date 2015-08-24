echo on
set GITHUB_ACCOUNT=Veta99
set WS_DIR=Workspace
set REPO_NAME=CSV_Title_Validation
set APP_VERSION=1.1
set MAIN_CLASS=core.CSV
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
SLEEP 2
CALL mvn package -Dbuild.version="%APP_VERSION%"
ECHO.
ECHO Executing Java programm ...
java -jar C:\%WS_DIR%\%REPO_NAME%\target\%REPO_NAME%-%APP_VERSION%-jar-with-dependencies.jar
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
