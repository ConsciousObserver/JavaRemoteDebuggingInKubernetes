
docker run --rm -p 8080:8080 -p 8787:8787 --env _JAVA_OPTIONS=-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8787 --name java-remote-debugging-test java-remote-debugging-test