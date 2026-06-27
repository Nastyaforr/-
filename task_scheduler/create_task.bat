@echo off
setlocal enabledelayedexpansion

:: =============================================
:: Скрипт для создания задания в планировщике Windows
:: Разработчик: Абрамян А.А.
:: Группа: 24КИР3
:: Вариант: 16
:: =============================================

:: Проверка прав администратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ОШИБКА: Запустите скрипт от имени администратора.
    pause
    exit /b 1
)

set "task_name=MyScheduledTask"
set "task_time=14:30"
set "task_path=C:\Windows\System32\calc.exe"

echo Создание задания "%task_name%" на время %task_time%
echo Запускаемый файл: %task_path%
echo ----------------------------------------

schtasks /create /tn "%task_name%" /tr "%task_path%" /sc once /st %task_time% /f

if %errorlevel% equ 0 (
    echo Задание "%task_name%" успешно создано.
    echo.
    echo Проверка задания:
    schtasks /query /tn "%task_name%" /fo list
) else (
    echo ОШИБКА: Не удалось создать задание.
    echo Проверьте права доступа и корректность времени.
)

pause
