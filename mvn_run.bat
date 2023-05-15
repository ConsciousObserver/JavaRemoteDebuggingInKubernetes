@echo off
echo build takes a profile and phase as input

set profile=%1
set phase=%2

if "%1" == "" set profile=local
if "%2" == "" set phase=package

set MAVEN_DEBUG_ADDRESS=8787

echo spring.profiles.active = %profile%, phase = %phase%

set command=mvn spring-boot:run --update-snapshots -DskipTests clean %phase% -Dspring.profiles.active=%profile%
echo %command%

call %command%