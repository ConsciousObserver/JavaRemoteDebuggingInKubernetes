@echo off
echo build takes a profile and phase as inupt

set phase=%1

if "%1" == "" set phase=package

echo phase = %phase%

set command=mvn --update-snapshots -DskipTests %phase%
echo %command%

call %command%