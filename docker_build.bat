@REM Docker memory and JVM memory both are supplied so that Docker kills the process when JVM runs out of memory

docker build -t java-remote-debugging-test ./ --build-arg ARG_APP_PORT=8080 --memory 768m --build-arg ARG_SERVER_MEMORY=768