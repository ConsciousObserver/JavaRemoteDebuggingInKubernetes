@echo off

setlocal
set pod_name=%1
kubectl port-forward %pod_name% 8787:8787 -n api-test
endlocal