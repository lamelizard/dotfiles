@echo off

REM Build the Docker image using the Dockerfile in the current directory
docker build -t "latex" .

REM Check if the build was successful
IF %ERRORLEVEL% EQU 0 (
    echo Docker image built successfully: %ImageName%
) ELSE (
    echo Failed to build Docker image.
)
pause