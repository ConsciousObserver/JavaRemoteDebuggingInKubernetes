@echo off

setlocal

set option=%1

if "%option%" == "" (
    echo Script takes an option as argument, use number as option
    
    echo:
    
    echo 1. Run local JAR in target/ in debug mode
    echo 2. Run Dockerized application in debug mode and expose debug port on localhost
)

if "%option%" == "1" (
    java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8787 -jar target\JavaRemoteDebugging-0.0.1-SNAPSHOT.jar
)

if "%option%" == "2" (
    REM set DEBUG_VAR=-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8787
    
    set DEBUG_VAR=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8787
    
    set command=docker run --rm -p 8080:8080 -p 8787:8787 --env JAVA_TOOL_OPTIONS=%DEBUG_VAR% --name java-remote-debugging-test java-remote-debugging-test
    
    echo "%command%"
    
    %command%
)


@endlocal

echo %debug_var%