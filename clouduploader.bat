@echo off
setlocal

rem Check if the file path is provided
if "%~1"=="" (
    echo Usage: clouduploader ^/path^/to^/file.txt
    exit /b 1
)

set FILE=%~1
if "%~2"=="" (
    set AZURE_CONTAINER=%AZURE_STORAGE_CONTAINER%
) else (
    set AZURE_CONTAINER=%~2
)

rem Validate the file path
if not exist "%FILE%" (
    echo File not found: %FILE%
    exit /b 1
)

rem Upload the file to Azure Blob Storage
az storage blob upload --account-name %AZURE_STORAGE_ACCOUNT% --account-key %AZURE_STORAGE_KEY% --container-name %AZURE_CONTAINER% --file "%FILE%" --name %~nx1%

rem Check for upload success
if "%errorlevel%"=="0" (
    echo File uploaded successfully!
) else (
    echo File upload failed!
    exit /b 1
)
