@echo off
setlocal EnableDelayedExpansion
set instancia="i-05c......"
set ssh="sg-id1"
set blockall="sg-id2"
set www="sg-id3"
echo *************************
echo ** AWS CLIENTE  **
echo *************************
echo * 1 - ) Habilitar Web   *
echo * 2 - ) Habilitar SSH   *
echo * 3 - ) Bloquear todo   *
echo *************************
set /p opc="Introduce opcion (1, 2 o 3): "
if "%opc%" == "1" (
    aws ec2 modify-instance-attribute --instance-id %instancia% --groups %www%
) else if "%opc%" == "2" (
    aws ec2 modify-instance-attribute --instance-id %instancia% --groups %ssh%
) else if "%opc%" == "3" (
    aws ec2 modify-instance-attribute --instance-id %instancia% --groups %blockall%
) else (
    echo salir
)