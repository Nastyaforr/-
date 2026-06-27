@echo off
setlocal enabledelayedexpansion

:: =============================================
:: Скрипт для расчёта общего размера папки
:: Разработчик: Маслов С.А.
:: Группа: 24КИР2
:: Вариант: 8
:: =============================================

if "%1"=="" (
    echo ОШИБКА: Укажите путь к папке.
    echo.
    echo Использование: folder_size.bat "C:\путь\к\папке"
    echo.
    pause
    exit /b 1
)

if not exist "%1" (
    echo ОШИБКА: Папка "%1" не найдена.
    pause
    exit /b 1
)

if not exist "%1" (
    echo ОШИБКА: Папка "%1" не найдена.
    pause
    exit /b 1
)

set "folder=%1"
set "total_size=0"

echo Рассчёт размера папки: %folder%
echo ----------------------------------------

for /r "%folder%" %%f in (*) do (
    set /a "total_size+=%%~zf"
    echo %%~zf bytes - %%~nf
)

echo ----------------------------------------
echo Общий размер: %total_size% байт

:: Перевод в мегабайты и гигабайты
set /a "total_mb=%total_size% / 1048576"
set /a "total_gb=%total_size% / 1073741824"

echo Общий размер: %total_mb% МБ
echo Общий размер: %total_gb% ГБ

pause
