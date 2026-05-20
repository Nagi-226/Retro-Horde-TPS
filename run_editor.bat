@echo off
chcp 65001 >nul
title Retro Horde - Godot Editor
cd /d "D:\Godot Projects\retro-horde-tps"

echo ========================================
echo   Retro Horde - Godot Editor Mode
echo   Godot 4.6.2  TPS Survival Shooter
echo ========================================
echo.
echo Opening Godot Editor with project...
echo Real-time preview: Press F5 in editor to run the game
echo.

set GODOT_PATH=C:\Users\FJL03\AppData\Local\Microsoft\WinGet\Links\godot.exe

if not exist "%GODOT_PATH%" (
    echo [ERROR] Godot not found at: %GODOT_PATH%
    echo Please install Godot 4.x first.
    pause
    exit /b 1
)

start "" "%GODOT_PATH%" --editor --path "%cd%"

echo Editor launched. Use F5 to test the game in real-time.
