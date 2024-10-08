@echo off
setlocal enabledelayedexpansion
set "path=%~dp0"
cd %path%
echo %path%
echo %~1

REM Check if arguments are provided
IF "%~1"=="" (
    echo Usage: %~nx0 "input_file" "extension1 extension2"
    exit /b 1
) ELSE (
    set "args=%~1"
)

echo %args%

REM Check if the second argument is provided
IF "%~2"=="" (
    set /p "extensions=Please enter the extensions (separated by spaces): "
) ELSE (
    SET "extensions=%~2"
)

echo "!args!" !extensions!

"%path%\Lib\php\php.exe" -f "%path%\convert_args.php" "!args!" !extensions!

