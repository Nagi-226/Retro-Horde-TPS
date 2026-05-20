@echo off
setlocal enabledelayedexpansion

title Retro Horde - Game Runner
cd /d "D:\Godot Projects\retro-horde-tps"

echo ========================================
echo   Retro Horde - Godot 4.6.2 TPS Survival
echo ========================================
echo.

set "GODOT_PATH=C:\Users\FJL03\AppData\Local\Microsoft\WinGet\Links\godot.exe"

if not exist "%GODOT_PATH%" (
    echo [ERROR] Godot not found at: %GODOT_PATH%
    echo Install Godot 4.x from https://godotengine.org/download/
    pause
    exit /b 1
)

:: Parse mode: --editor / --headless / default (run game)
if "%~1"=="--editor" (
    echo [Mode] Editor - Press F5 in editor for live preview
    start "" "%GODOT_PATH%" --editor --path "%CD%" %2 %3 %4
    goto :done
)

if "%~1"=="--headless" (
    echo [Mode] Headless - Running without window
    "%GODOT_PATH%" --headless --path "%CD%" %2 %3 %4
    goto :done
)

:: Default: run game directly
echo [Mode] Run Game
echo Close the game window or press ESC to return to menu.
echo.
start "" "%GODOT_PATH%" --path "%CD%" %1 %2 %3 %4

:done
echo.
echo ========================================
echo   Game launched. Happy hunting.
echo ========================================
endlocal
