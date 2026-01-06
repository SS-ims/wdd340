@echo off
REM Double-click this file to run the PowerShell script elevated.
set SCRIPT=%~dp0set-remoteSigned-elevated.ps1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-File','%SCRIPT%' -Verb RunAs"
