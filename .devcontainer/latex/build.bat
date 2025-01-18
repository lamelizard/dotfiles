@echo off

REM break the cache, but only once for all images together
SET CURRENT_TIME="%time%"

REM Build the Docker images using the Dockerfile in the current directory
docker build --target latex -t "latex" --build-arg BREAK_CACHE="%CURRENT_TIME%" .
REM Check if the build was successful
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to build Docker image.
    pause
    exit /b %ERRORLEVEL%
)
echo Docker image built successfully: %ImageName%

docker build --target latex-gui -t "latex-gui" --build-arg BREAK_CACHE="%CURRENT_TIME%" .
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to build Docker image.
    pause
    exit /b %ERRORLEVEL%
)
echo Docker image built successfully: %ImageName%
pause