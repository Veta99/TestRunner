echo on
set GITHUB_ACCOUNT=Veta99
set WS_DIR=Workspace
set REPO_NAME=E2E_TV
set APP_VERSION=1.1
set MAIN_CLASS=core.TV
if "%JAVA_HOME%" == "" GOTO EXIT_JAVA
ECHO Java installed
if "%M2%" == "" GOTO EXIT_MVN
ECHO Maven installed
CALL git --version > nul 2>&1
if NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
ECHO Git installed
GOTO NEXT
:NEXT
CD C:\%WS_DIR%
git clone https://github.com/%GITHUB_ACCOUNT%/%REPO_NAME%.git
CD %REPO_NAME%
SLEEP 2
CALL mvn clean site test -Dtest=AllTests -Dbuild.version="%APP_VERSION%"
ECHO.
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
CD C:\
