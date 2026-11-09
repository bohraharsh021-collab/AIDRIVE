@echo off
title AIDRIVE - The Shoemaker's Agentic Pen Drive (BIT Sathy ECE)
color 0A

echo ====================================================================
echo        AIDRIVE: The Shoemaker's Agentic Pen Drive
echo        Bannari Amman Institute of Technology (BIT Sathy)
echo ====================================================================
echo.

:: Detect Python environment
set PYTHON_CMD=
where py >nul 2>&1
if %ERRORLEVEL% equ 0 (
    set PYTHON_CMD=py
    goto :FOUND_PYTHON
)

where python >nul 2>&1
if %ERRORLEVEL% equ 0 (
    set PYTHON_CMD=python
    goto :FOUND_PYTHON
)

:: Check common embedded paths on USB
if exist "%~dp0python\python.exe" (
    set PYTHON_CMD="%~dp0python\python.exe"
    goto :FOUND_PYTHON
)

echo [ERROR] Python not found on host machine or USB drive!
echo Please install Python 3.9+ or run portable embedded python.
pause
exit /b 1

:FOUND_PYTHON
echo [AIDRIVE] Launching Shoemaker Interactive Terminal Workshop...
echo.

:: Start AIDRIVE Interactive CLI
%PYTHON_CMD% "%~dp0core\cli.py"

pause
