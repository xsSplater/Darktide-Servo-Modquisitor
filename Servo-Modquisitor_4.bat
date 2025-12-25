REM Made by xsSplater under GPL 3.0 license
@echo off
1>nul chcp 65001
setlocal enableextensions enabledelayedexpansion
mode con cols=100 lines=34

REM ████████WH40k Darktide - Servo-Modquisitor. ex: Mod Load Order File Maker██████████████████████████████████
REM ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓Supports Russian/English with auto-detection and command-line parameters▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓Usage:▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓▓▓▓mod_sorter.bat▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-- Auto language, quiet mode▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓▓▓▓mod_sorter.bat --ru▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-- Force Russian language▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓▓▓▓mod_sorter.bat --en▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-- Force English language▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓▓▓▓mod_sorter.bat --log▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-- Enable logging to mod_sorter.log▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓▓▓▓mod_sorter.bat --ru --log▒▒▒▒▒▒▒▒▒▒▒▒-- Options combined▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓▓▓▓mod_sorter.bat --en --log▒▒▒▒▒▒▒▒▒▒▒▒-- Options combined▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ███████████████████████████████████████████████████████████████████████████████████████████████████████████

:INIT
REM Initialize settings
set "LANGUAGE=auto"
set "LOG_ENABLED=0"
set "ERROR_COUNT=0"

REM Parse command line parameters
:PARSE_PARAMETERS
if "%~1"=="" goto :PARSE_END
if /i "%~1"=="--ru" set "LANGUAGE=ru"
if /i "%~1"=="--en" set "LANGUAGE=en"
if /i "%~1"=="--log" set "LOG_ENABLED=1"
shift
goto :PARSE_PARAMETERS
:PARSE_END

REM Detect SYSTEM LANGUAGE if not specified
:DETECT_LANGUAGE
if "!LANGUAGE!"=="auto" (
	REM Check system locale via registry
	for /f "tokens=2*" %%I in ('reg query "HKCU\Control Panel\International" /v LocaleName 2^>nul') do (
		set "SYSTEM_LOCALE=%%J"
	)
	REM If registry method failed, try wmic
	if not defined SYSTEM_LOCALE (
		for /f "tokens=2 delims==" %%I in ('wmic os get locale /value 2^>nul') do (
			set "SYSTEM_LOCALE=%%I"
		)
	)
	
	REM If both methods failed, use environment variable
	if not defined SYSTEM_LOCALE (
		if not "%USERNAME:п%=%"=="%USERNAME%" (
			set "LANGUAGE=ru"
		) else if not "%USERNAME:а%=%"=="%USERNAME%" (
			set "LANGUAGE=ru"
		) else if not "%USERNAME:е%=%"=="%USERNAME%" (
			set "LANGUAGE=ru"
		) else (
			set "LANGUAGE=en"
		)
	) else (
		REM Clean and check the locale value
		set "SYSTEM_LOCALE=!SYSTEM_LOCALE: =!"
		if "!SYSTEM_LOCALE!"=="0419" set "LANGUAGE=ru"
		if "!SYSTEM_LOCALE!"=="ru-RU" set "LANGUAGE=ru"
		if "!SYSTEM_LOCALE!"=="ru" set "LANGUAGE=ru"
		if "!SYSTEM_LOCALE!"=="en-US" set "LANGUAGE=en"
		if "!SYSTEM_LOCALE!"=="en" set "LANGUAGE=en"
		if not defined LANGUAGE set "LANGUAGE=en"
	)
)

REM Initialize translations
if "!LANGUAGE!"=="ru" (
title "Вархаммер 40,000 Дарктайд - Серво-Модквизитор"
REM ████████В зависимости от языка получаем строки диалога:████████████████████████████████████████████████████
REM ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████████░░▒▓▓▓Русский▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓СООБЩЕНИЯ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	set "MSG_SERVIT_ENGD=▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓+++ СЕРВИТОР X55-P1473-R ВКЛЮЧЁН +++▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░█████▓▓"
	set "MSG_CRIT_ERROR_=// КРИТИЧЕСКАЯ ОШИБКА‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_____WARNING=// ПРЕДУПРЕЖДЕНИЕ‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_DEPRCTD_FND=// ОБНАРУЖЕНЫ УСТАРЕВШИЕ МОДЫ‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_CNFLCT_FND1=// КОНФЛИКТ МОДОВ‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_CNFLCT_FND2=// ОБНАРУЖЕНЫ НЕСОВМЕСТИМЫЕ МОДЫ:▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_DEPEND_MISS=// ОТСУТСТВУЕТ МОД НЕОБХОДИМЫЙ ДЛЯ РАБОТЫ ДРУГОГО МОДА‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_WRNG_UNPCKD=// ОБНАРУЖЕНЫ НЕПРАВИЛЬНО РАСПАКОВАННЫЕ МОДЫ‼ Это вызывает подпр0стр#нст//░"
	set "MSG_WRNG_UNPCK2=стр4нст..t..венные помех--хи, наруш% _^&щие раб0ту сис7ем. Срочн.. ..1ть‼"
	set "MSG_EMPTY_F_FND=// ОБНАРУЖЕНЫ ПУСТЫЕ ПАПКИ МОДОВ‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_MLO_NOT_FND=// Ой‼ Файл «mod_load_order.txt» не найден, но ничего страшного...▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_NEW_MLO_TXT=// Я могу сделать новый...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MSG_SRV_MQ_HERE=// Файл «Servo-Modquisitor.bat» точно находится в папке «mods»?▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MSG_SELECT_ACTN=++ Выбери действие, смертная плоть ++▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MSG_CLEAR_FLDR1=* ВНИМАНИЕ: Автоочистка несёт риск безвозвратной потери важных данных. *▓▓▓▓▒░░███████"
	set "MSG_CLEAR_FLDR2=* Протокол авточистки запрещён. Требуется прямое вмешательство оператора. *▓▒░░███████"
REM ████████░░▒▓▓▓ОПЦИИ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	set "OPT_CREATE_NEW_=[C] - Создай новый файл mod_load_order.txt и продолжи сортировку....▓▓▓▓▓▓▓▓▒░░██▓░░░░"
	set "OPT_CONTINUE_NO=[C] - Пропусти и продолжи сортировку... [НЕ рекомендуется‼]▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓░░░░"
	set "OPT_DEL_DEPRCTD=[D] - Удали папки устаревших модов и продолжи сортировку...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_WRNG_UNPCKD=[D] - Удали неправильно распакованные папки и продолжи сортировку...▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_DELET_EMPTY=[D] - Удали пустые папки и продолжи сортировку...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_STEAM_GUIDE=[S] - Обратитесь к писаниям Омниссии [Руководство Steam]...▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	set "OPT_MANUAL_EXIT=[Q] - Я проведу ручную диагностику...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	set "OPT_MAN_FL_EXIT=[Q] - Я проведу ручную диагностику... Открой папку «mods»‼▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	set "START_STEAM_GUIDE=start https://steamcommunity.com/sharedfiles/filedetails/?id=2950374474"
) else (
title "Warhammer 40,000 Darktide - Servo-Modquisitor"
REM ████████░░▒▓▓▓English▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████████░░▒▓▓▓MESSAGES▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	set "MSG_SERVIT_ENGD=▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓+++ SERVITOR X55-P1473-R ENGAGED +++▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░█████▓▓"
	set "MSG_CRIT_ERROR_=// CRITICAL ERROR‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_____WARNING=// WARNING‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_DEPRCTD_FND=// DEPRECATED MODS FOUND‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_CNFLCT_FND1=// MOD CONFLICT‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_CNFLCT_FND2=// INCOMPATIBLE MODS DETECTED‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_DEPEND_MISS=// A MOD REQUIRED BY ANOTHER MOD IS MISSING‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_WRNG_UNPCKD=// MALF0RMED M0DS DETECTED‼ Causing syste# corr#ption a// da7#$..▓▓▒░░░░░"
	set "MSG_WRNG_UNPCK2=4nd data l*s.ss err0rs... Immed;#te rem0v-Val r3qqQu`_red‼ Purge n0w.."
	set "MSG_EMPTY_F_FND=// EMPTY MOD FOLDER DETECTED‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "MSG_MLO_NOT_FND=Oops‼ File "mod_load_order.txt" not found, but that's okay...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
	set "MSG_NEW_MLO_TXT=I can make a new one...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MSG_SRV_MQ_HERE=// Is the file "Servo-Modquisitor.bat" in the "mods" folder?▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MSG_SELECT_ACTN=++ Select an action, mortal flesh-unit ++▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MSG_CLEAR_FLDR1=* WARNING: Auto-Purge risks critical data loss. Protocol forbidden. *▓▓▓▓▓▓▓▒░░███████"
	set "MSG_CLEAR_FLDR2=* Direct intervention required. Commence manual deletion. *▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
REM ████████░░▒▓▓▓OPTIONS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	set "OPT_CREATE_NEW_=[C] - Create new 'mod_load_order.txt' and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓░░░░"
	set "OPT_CONTINUE_NO=[C] - Skip and continue sorting... [Highly NOT recommended‼]▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓░░░░"
	set "OPT_DEL_DEPRCTD=[D] - Purge obsolete mods folders and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_WRNG_UNPCKD=[D] - Purge incorrectly unpacked folders and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_DELET_EMPTY=[D] - Purge empty folders and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_STEAM_GUIDE=[S] - Consult the Omnissiah's scriptures [Steam Guide]...▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
	set "OPT_MANUAL_EXIT=[Q] - I shall perform manual diagnostics...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
	set "OPT_MAN_FL_EXIT=[Q] - I shall perform manual diagnostics... Open the 'mods' folder‼▓▓▓EXIT‼▓▒░░███████"
	set "START_STEAM_GUIDE=start https://steamcommunity.com/sharedfiles/filedetails/?id=2953324027"
)

												call :LOGSTART "=== Mod Sorter Started ==="
												call :LOG "Language: !LANGUAGE!"
												call :LOG "Logging: !LOG_ENABLED!"

:SHOW_BANNER
REM 												OMNISSIAH GRANTS YOU THE ACHIEVEMENT: "CURIOUS CODER"!
cls
color 0A
REM Greenish 100х30
echo.
echo ████████████████████████████████████████████████████████████████████████████████████████████████████
echo ██████████████01101001 01101110 01100101 00100000 01000111 01101111 01100100 00100000███████████████
echo ████████████████████████████████████████▓▓▒▒░░░░░░▒▓▓▓▓▓▓▓▓▓████████████████████████████████████████
echo ████████████████████████████████████▓▒░Mod Load Order File Maker▒▓██████████████████████████████████
echo ████████████████████████████████▓▒░░░░░░░░░░░░░░▒▓▓▓▒▓████████████▓▒▓███████████████████████████████
echo ██████████████████████████████▒░░░░░░░▒▓▓▓░░░░░▓██▓░░██████▓▒▓██████▓▒▓█████████████████████████████
echo ████████████████████████████▒░░░░░░░▒██████▓▓▓████▓░░▒▒▓▓▓▒░░░░▒██████▓▒████████████████████████████
echo ██████████████████████████▓░░░░░░░░░░▓████████████▓░░░░░░░░░░░░█████████▓▒██████████████████████████
echo █████████████████████████▒░░░░░▒▓░░░▓███████▓▒░░░░▓███▓▓▒░░░░░░▒██████████▒▓████████████████████████
echo ████████████████████████░░░░░░███████████▓▒░░░░░░░▓███████▓▒░░░░░▒▓▒░░▓████▒▓███████████████████████
echo ███████████████████████▒░░░░░███████████░░░░░░░░░░▓█████████▓░░░░░░░░░░▒████▒▓██████████████████████
echo ██████████████████████▓░░░░░░▒▓████████░░░░░░░░░░░▓███████████░░░░░░░▒▓██████░██████████████████████
echo ██████████████████████░░░░░░░░░▓███████░░░░░░░░░░░▓███████████░░░░░░░████████▒▓█████████████████████
echo █████████████████████▓░░░░░░▒▒▓████████░░░░░░░░░░░▓███████████░░░░░░░░████████░█████████████████████
echo █████████████████████▒░░░░▒████████████▓░░░░░░░░░░▓██████████░░░░░░░░░░░░░████░█████████████████████
echo █████████████████████▒░░░░▒█████████████▒░░░░░░░░░░▓█████████▓░░░░░░░░░░░░░████░████████████████████
echo █████████████████████▓░░░░░▒▒▒▓█████████░░░▒▒░░░░░▓█████▓▓▓██░░░░░░░░░▓███████░█████████████████████
echo ██████████████████████░░░░░░░░░████████▒░░██████▒░▓█▒░░░░░░██▓░░░░░░░████████▓▒█████████████████████
echo ██████████████████████▒░░░░░░░▒▓████████░░░▒▒▒░░░░▒███▓▓▒▓███░░░░░░░░▓███████░██████████████████████
echo ███████████████████████░░░░░░████████████░░░░░░░░▓▓░███████▓░░░░░░░░░░░▓████▒▓██████████████████████
echo ████████████████████████░░░░░░██████████████▓░░░░░▓█████▒░░░░░░░░░▒▒░░░▒████▒▓██████████████████████
echo █████████████████████████░░░░░░▓▒░░░▓███████░░░░▒░▓█▓███▓░░░░░░▒██████████▒▓████████████████████████
echo ██████████████████████████▓░░░░░░░░░░▓████████████▓░░░░░░░░░░░░█████████▓▒██████████████████████████
echo ████████████████████████████▒░░░░░░░▒██████▓▓█████▓░░░▒▒▓▓▒░░░░░███████▒▓███████████████████████████
echo ██████████████████████████████▒░░░░░░░▒▓█▓░░░░░▓██▓░░██████▓▒▓██████▓▒▓█████████████████████████████
echo ████████████████████████████████▓▒░░░░░░░░░░░░░░▒██▓▒▒████████████▓▒▒███████████████████████████████
echo ███████████████████████████████████▓▒░░░░░Servo-Modquisitor███▓▓▒▓██████████████████████████████████
echo ███████████████████████████████████████▓▓▒▒░░░░░░░▒█▓▓▓▓▓▓▓▓▓███████████████████████████████████████
echo ██████████████01110111 01100001 01110100 01100011 01101000 01100101 01110011 00100001███████████████
echo ████████████████████████████████████████████████████████████████████████████████████████████████████
timeout /t 1 1>nul
REM cls
REM color 0A
REM Greenish 100х27
REM echo.
REM echo ░░░███████████████████████████▒░░░░░░░░░░░░░░░░░░░▒████████████████████▒░░░░░░░░░░░░░░▒▒░░░░░░░░░███
REM echo ░▒█████████████████████████████▒▒▒░░░░░░░░░░░░░░░░▓██████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░▓█
REM echo ▒██████████████████████████▓▓▓▓▓▓███▓░░░░░░░░░░░░██▓▓▓▓▓██████████████████▓▓▓░░░░░░░░░░░░░░░░░░░░░░▒
REM echo █████████████████████████▓░░░░░░░░░▓███████████████░░░░░███████████████▒▒▒▒▓██░▒▓▓▓█▓▓▓▒░▒▓▓▓▓▓▓▓▓▓▓
REM echo ██▓▓▓▓██▓▓▓▓███▓▒▒▒▒▓▓███░░░░░▓░░░░░██▓▓▓▓▓▓▓▓▓▓███░░░░░████▓▒▒▒▒▓▓███▒░░░░▒▓███▓▒▒▒▒▓▓████▓▓▓▓▓█▓▓█
REM echo ██░░░▓█▓▓░░░█▒░░░░░░░░░█▓░░░░░█▓▒▒▒▒██░░░░░░░░░░▒██░░░░░██▒░░░░░░░░░█▓░░░░░░░█▓░░░░░░░░░▓█▓░░░░░░░▒█
REM echo ▓█▓░░░▓▓░░░▓█░░░░▓█░░░░▓█░░░░░░▓▓█████░░░░░█▒░░░░▓█░░░░░█▓░░░░▓▓░░░░▒█▓░░░░▒██░░░░░█░░░░░█▓░░░░░░░░█
REM echo ░██░░░░░░░░██░░░░░▓▓██████▒░░░░░░░▒███░░░░░█▒░░░░▓█░░░░░█▓▓▓▓▓▓▒░░░░▒█▓░░░░▒██░░░░░▓░░░░░█▓░░░░░▓▒██
REM echo ░▓█▓░░░░░░▓███▒░░░░░░░▓█████▓▓░░░░░░██░░░░░█▒░░░░▓█░░░░░███▒▒░░░░░░░░█▓░░░░▒██░░░░░░░░░░░▓▓░░░░░████
REM echo ░██░░░░░░░░████▓▓▓░░░░░▒█░░░░▓█▒░░░░▒█░░░░░█▒░░░░▓█░░░░░█▓░░░░▓▓░░░░░█▓░░░░▒██░░░░░███████▓░░░░░████
REM echo ██▓░░░▓▓░░░▓█░░░░▓█░░░░▒█░░░░░█▓░░░░▒█░░░░░█▒░░░░▓█░░░░░█▓░░░░▓▓░░░░░█▓░░░░▒██░░░░░█▓░░░░█▓░░░░░██▒▒
REM echo ██░░░░█▓░░░░█▒░░░░▒░░░░▓█▒░░░░░░░░░░██░░░░░░░░░░▒██░░░░░█▓░░░░░░░░░░░██░░░░░▒█▓░░░░▓▓░░░▒█▓░░░░░██░░
REM echo ██▒▒▒▒██▒▒▒▒▓█▓▒▒░░░▒▒█████▒▒░░░░▒▓███░░░░░█████▓██▒▒▒▒▒██▓▒░░░░▒░░░░██▓▒▒▒▒▒███▓░░░░░▒████▒▒▒▒▓██░░
REM echo ██████████████████████████████████▓▓██░░░░░█████▓▓██████████████████████████▓▓▒▒▓█████▓▓▒▓▓████▓▓▒░░
REM echo ███████████████████████████▒░░░░░░░░▓███████▓░░░░░▒███████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░
REM echo ███████████████████████████▒░░░░░░░░░░░░░░░░░░░░░░▒███████████████████████░░░░░░░░░░░░░░░░░░░░░░▒░░░
REM echo ░░░░▒█████████████████████▓░░░░░░▒▒▒▒░░░░░░░░░░░░░▒█████████████▓▓▒▓██████▓░░░░░░░░░░░░░░░░░░░░▓████
REM echo ░░░░░▓███████████████████░░░░░░▓███████▓▓▒▒░░░░░░░▒███████▓▓▒░░░░░░░░░██████░░░░░░░░░░░░░░░░░░▒█████
REM echo ░░░░░░██████████████████▒░░░░░░███████████████▒░░░▒███▓░░░░░░░░░░░░░░░▓█████▓░░░░░░░░░░░░░░░░░██████
REM echo ░░░░░░▒██████████████████░░░░░░▒█████████████▓▒░░░▒███▓▒░░░░░░░░░░░░░▒██████░░░░░░░░░░░░░░░░░▒██████
REM echo ░░░░░░░███████████████████░░░░░░░▓████▓▓▒▒░░░░░░░░▓████████▓▒▒░░░░░░▓██████░░░░░░░░░░░░░░░░░░███████
REM echo ░░░░▒▓█████████████████████░░░░░░░░░░░░░░░░░░░░░░█▒░▒█████████████████████░░░░░░░░░░░░░░░░░░░▒▒▓████
REM echo ▒▓█████████████████████████▓░░░░░░░░░░░░░░░░░░░░██▒░░▒███████████████████▓░░░░░░░░░░░░░░░░░░░░░░░▒▓█
REM echo ▒███████████████████████████▓░░░░░░░░░░░░░░░░░░▓█▓▓▒░░▓█████████████████▒░░░░░░░░░░░░░░░░░░░░░░░░░░▒
REM echo ░▒█████████████████████████████▓▒▒▓▓█▓░░░░░░░░░▒░░▓██▓▓████████▒░░▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒█
REM echo ░░▒██████████████████████████████████░░░░░░░░░░░░░▓█████████████░░░░░░░░░░░░░░░░░░░░░░▒░░░░░░░░░░▓██
REM echo ░░░░▓███████▓▒▒▓████████████████████▓░░░░░░░░░░░░░▓█████████████▓░░░░░░░░░░░░░░░░░░░▒████▓▒░░░░░████
REM echo.

												call :LOG "Step 1: Checking installation location"
:STEP_1_CHECK_INSTALLATION
if NOT exist base (
												call :LOG "ERROR: BASE folder not found‼"
	set /a ERROR_COUNT+=1
	call :SHOW_INSTALLATION_ERROR "base" "Darktide Mod Loader"
)
if NOT exist dmf (
												call :LOG "ERROR: DMF folder not found‼"
	set /a ERROR_COUNT+=1
	call :SHOW_INSTALLATION_ERROR "dmf" "Darktide Mod Framework"
)

if !ERROR_COUNT! GTR 0 (
		echo %MSG_PRESS_ANY_KEY%
		pause >nul
	exit /b 1
)
												call :LOG "Installation check passed"

												call :LOG "Step 2: Checking mod_load_order.txt"
:STEP_2_CHECK_MOD_LOAD_ORDER
if NOT exist "mod_load_order.txt" call :SHOW_MOD_LOAD_ORDER_MISSING
												call :LOG "mod_load_order.txt finded"


:STEP_3_CHECK_OBSOLETE_MODS
												call :LOG "Step 3: Checking for obsolete mods"
set "OBSOLETE_FOUND=0"
set "OBSOLETE_LIST="
call :CHECK_OBSOLETE_MODS

if !OBSOLETE_FOUND! == 1 (
												call :LOG "Obsolete mods found: !OBSOLETE_LIST!"
	call :SHOW_OBSOLETE_MODS_WARNING
)
												call :LOG "Obsolete mods not found"

:STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
												call :LOG "Step 4: Checking malformed mod folders"
set "MALFORMED_FOUND=0"
set "MALFORMED_LIST="
call :CHECK_MALFORMED_MODS

if !MALFORMED_FOUND! == 1 (
												call :LOG "Malformed mods found: !MALFORMED_LIST!"
	call :SHOW_MALFORMED_MODS_WARNING
)
												call :LOG "Malformed mods not found"

:STEP_3B_CHECK_EMPTY_FOLDERS
												call :LOG "Step 5: Checking empty folders"
set "EMPTY_FOUND=0"
set "EMPTY_LIST="
call :CHECK_EMPTY_FOLDERS

if !EMPTY_FOUND! == 1 (
												call :LOG "Empty folders found: !EMPTY_LIST!"
	call :SHOW_EMPTY_FOLDERS_WARNING
)
												call :LOG "Empty folders not found"

:STEP_4_CHECK_INCOMPATIBLE_MODS
												call :LOG "Step 6: Checking incompatible mods"
call :CHECK_INCOMPATIBLE_MODS

if !INCOMPATIBLE_FOUND! == 1 (
												call :LOG "Incompatible mods found, showing dialog"
	call :SHOW_INCOMPATIBLE_MODS_ERROR
REM После возврата из диалога продолжаем проверять конфликты
	goto :STEP_4_CHECK_INCOMPATIBLE_MODS
) else (
	goto :STEP_5_CHECK_DEPENDENCIES
)
												call :LOG "No incompatible mods found"

:STEP_5_CHECK_DEPENDENCIES
												call :LOG "Step 7: Checking dependencies"
set "DEPENDENCY_ERROR=0"
call :CHECK_DEPENDENCIES

if !DEPENDENCY_ERROR! == 1 (
												call :LOG "Dependency errors found"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
												call :LOG "Dependency errors not found"

:STEP_6_CREATE_MOD_LIST
												call :LOG "Step 8: Creating mod_load_order.txt"
call :CREATE_MOD_LOAD_ORDER
												call :LOG "mod_load_order.txt created"

:SUCCESS
												call :LOG "=== Mod Sorter Completed Successfully ==="
	if "!LANGUAGE!"=="ru" (
	cls
	color 0A
	REM Зелёненькое 100х30
	echo.
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▓
	echo ▓█▒░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▓
	echo ███▓▒▓▓█░░▒███████████████████████████████████████████████████████████████████████████████▒░░▒▓▓█▓░░
	echo ████████░░▒███████████████████████████████████████████████████████████████████████████████▒░░░░░░░░░
	echo █████▓▒░░░▒███████████████████████████████████████████████████████████████████████████████▒░░▓▓▒░░░░
	echo ██▓░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░█████▒░
	echo ▓░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░███████
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░███████
	echo ░░░░░░░░░░▒█▓▓▓▓▓▓██▓▓▓▓█████▓▓▓█▓▓▓▓▓▓▓██▓▓▓▓▓▓███▓▓▓▓▓▓▓█▓▓▓█▓▓▓█▓▓▓▓▓█▓▓▓▓█▓▓▓██▓▓▓▓▓██▒░░███████
	echo ░░░░░░░░░░▒█░░░░░░▒█▒░░▒█████░░░█░░░░░░░█▓▒░░░░▒▓█▓▒░░░░░▒█░░░▓░░░█░░░░░█▒░░▒▓░░▒█▒░░░░░▒█▒░░███████
	echo ▒░░░░░░░░░▒█░░░▓░░░█▒░░▒▓████░░░█░░░▓░░░█▒░░▒▓░░▒█▒░░▓▒░░▒█░░░▓░░░█░░░▓██▒░░▒▓░░▒█░░░▓░░░█▒░░███████
	echo ▒░░░░░░░░░▒█░░░▓░░░█▒░░▒▓████░░░█░░░▓░░░█▒░░▒▓░░▒█▒░░▓▒░░▒█░░░▓░░░█░░░▓██▒░░▒▓░░▒█░░░▓░░░█▒░░███████
	echo █░░░░░░░░░▒█░░░░░░▒█▒░░░░░░▒█░░░█░░░▓░░░█▒░░▒▓░░▒█░░░▓▒░░▒█░░░░░░░█░░░░░█▒░░░░░░▒█░░░▓░░░█▒░░███████
	echo █░░░░░░░░░▒█░░░░░░▒█▒░░░░░░▒█░░░█░░░▓░░░█▒░░▒▓░░▒█░░░▓▒░░▒█░░░░░░░█░░░░░█▒░░░░░░▒█░░░▓░░░█▒░░███████
	echo ▓░░▒▒▒░░░░▒█░░░▓░░░█▒░░▒▓░░░█░░░█░░░▓░░░█▒░░▒▓░░▒█░░░▓▒░░▒█░░░▓░░░█░░░▓██▒░░▒▓░░▒█░░░▓░░░█▒░░██▓▓▓██
	echo ░░░█████░░▒█░░░▓░░░█▒░░▒▓░░▒█░░░█░░░▓░░░█▓░░▒▓░░▒█░░░▓▒░░▒█░░░▓░░░█░░░▓▓█▒░░▒▓░░▒█░░░▓░░░█▒░░░░░░░▓█
	echo ░░░█████░░▒█░░░▓░░░█▒░░▒▓░░▒█░░░█░░░▓░░░█▓░░▒▓░░▒█░░░▓▒░░▒█░░░▓░░░█░░░▓▓█▒░░▒▓░░▒█░░░▓░░░█▒░░░░░░░▓█
	echo ▓░░░▒▒▒░░░▒█░░░░░░▒█▒░░░░░░▓█░░░█░░░▓░░░██▓░░░░▒██░░░▓▒░░▒█░░░▓░░░█░░░░░█▒░░▒▓░░▒█▓░░░░░██▒░░█▓▒▒▓██
	echo █▓░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▒
	echo █████░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██▓░░░░
	echo █████░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░███░░░░
	echo ████████░░▒███████████████████████████████████████████████████████████████████████████████▒░░░░░░░░░
	echo ███▓▓▓██░░▒███████████████████████████████████████████████████████████████████████████████▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▒
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo.
timeout /t 1 1>nul
	) else (
	cls
	color 0A
	REM Greenish 100х30
	echo.
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▓
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▓
	echo ▓█▒░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▓
	echo ███▓▒▓▓█░░▒███████████████████████████████████████████████████████████████████████████████▒░░▒▓▓█▓░░
	echo ████████░░▒███████████████████████████████████████████████████████████████████████████████▒░░░░░░░░░
	echo █████▓▒░░░▒█████▓▒▒▒▒▒▒▒▒▒▒▓▓█████████▓▒░░░░░▒▒▓█████▓▒▒▒▒▒▓███▒▒▒▒▒▒███▒▒▒▒▒▒▒▒▒▒▒███████▒░░▓▓▒░░░░
	echo ██▓░░░░░░░▒█████░░░░░░░░░░░░░░░█████▒░░░░░░░░░░░░▓███▒░░░░░░███░░░░░░██▓░░░░░░░░░░░▓██████▒░░█████▒░
	echo ▓░░░░░░░░░▒█████░░░░░░░░░░░░░░░░███░░░░░░░▓▒░░░░░░▓██▒░░░░░░▒██░░░░░░██▓░░░░░░░░░░░▓██████▒░░███████
	echo ░░░░░░░░░░▒█████░░░░░░░██▒░░░░░░▓██░░░░░░▒██░░░░░░▒██▒░░░░░░░██░░░░░░██▓░░░░░░▒███████████▒░░███████
	echo ░░░░░░░░░░▒█████░░░░░░░██▒░░░░░░▓██░░░░░░▒██░░░░░░░██▒░░░░░░░░█░░░░░░██▓░░░░░░▒███████████▒░░███████
	echo ░░░░░░░░░░▒█████░░░░░░░██▒░░░░░░▓█▓░░░░░░▒██░░░░░░░██▒░░░░░░░░▒░░░░░░██▓░░░░░░░▓▓▓▓███████▒░░███████
	echo ▒░░░░░░░░░▒█████░░░░░░░██▒░░░░░░▓█▓░░░░░░▒██░░░░░░░██▒░░░░░░░░░░░░░░░██▓░░░░░░░░░░░███████▒░░███████
	echo ▒░░░░░░░░░▒█████░░░░░░░██▒░░░░░░▓█▓░░░░░░▒██░░░░░░░██▒░░░░░░░░░░░░░░░██▓░░░░░░░░░░░███████▒░░███████
	echo █░░░░░░░░░▒█████░░░░░░░██▒░░░░░░▓█▓░░░░░░▒██░░░░░░░██▒░░░░░░░░░░░░░░░██▓░░░░░░░░░░░███████▒░░███████
	echo ▓░░▒▒▒░░░░▒█████░░░░░░░██▒░░░░░░▓█▓░░░░░░▒██░░░░░░░██▒░░░░░▒░░░░░░░░░██▓░░░░░░▒███████████▒░░██▓▓▓██
	echo ░░░█████░░▒█████░░░░░░░██▒░░░░░░▓██░░░░░░▒██░░░░░░░██▒░░░░░▓▒░░░░░░░░██▓░░░░░░▒███████████▒░░░░░░░▓█
	echo ▓░░░▒▒▒░░░▒█████░░░░░░░██▒░░░░░░▓██░░░░░░▒██░░░░░░▒██▒░░░░░▓█░░░░░░░░██▓░░░░░░▒███████████▒░░█▓▒▒▓██
	echo █▓░░░░░░░░▒█████░░░░░░░▒▒░░░░░░░███░░░░░░░▓▒░░░░░░▓██▒░░░░░▓█▒░░░░░░░██▓░░░░░░░░░░░▒██████▒░░██████▒
	echo █████░░░░░▒█████░░░░░░░░░░░░░░░▒████░░░░░░░░░░░░░▒███▒░░░░░▓██░░░░░░░██▓░░░░░░░░░░░░██████▒░░██▓░░░░
	echo █████░░░░░▒█████▒░░░░░░░░░░░▒▒▓██████▓▒░░░░░░░░▒█████▒░░░░░███▓░░░░░░██▓░░░░░░░░░░░▒██████▒░░███░░░░
	echo ████████░░▒███████████████████████████████████████████████████████████████████████████████▒░░░░░░░░░
	echo ███▓▓▓██░░▒███████████████████████████████████████████████████████████████████████████████▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░██████▒
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░███████
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░███████
	echo ░░░░░░░░░░▒███████████████████████████████████████████████████████████████████████████████▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo.
	timeout /t 1 1>nul
)

start mod_load_order.txt

goto :EOF


REM ████████████████████████████████████████████████████████████████████████████████████████████
REM ████ФУНКЦИИ█████████████████████████████████████████████████████████████████████████████████
REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
:LOGSTART
if "!LOG_ENABLED!"=="0" goto :EOF
echo [%DATE% %TIME%] %*> "mod_sorter.log"
goto :EOF
:LOG
if "!LOG_ENABLED!"=="0" goto :EOF
echo [%DATE% %TIME%] %*>> "mod_sorter.log"
goto :EOF


:CREATE_MOD_LOAD_ORDER
												call :LOG "Creating mod load order header"
if "!LANGUAGE!"=="ru" (
	(echo -- ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	 echo -- ▒▓1. Если вам нужно добавить мод вручную, введите название папки▓▓▓▓▒
	 echo -- ▒▓▓▓▓вашего мода ниже. Каждый новый мод обязательно с новой строки.▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓2. Расположение в списке определяет порядок загрузки модов.▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓Чем ниже мод, тем больший приоритет в загрузке у него будет.▓▓▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓3. Не переименовывайте папку мода, т.к. внутри названия папок и▓▓▓▒
	 echo -- ▒▓▓▓▓записи внутри файлов зависят от этого названия.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓4. НЕ НУЖНО вносить в список папки «BASE» или «DMF» или вы▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓получите ошибку в игре‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓5. Если какой-то мод не попал в список, обязательно сообщите▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓мне об этом в моём Дискорде: https://discord.gg/BGZagw3xnz ▓▓▓▓▒
	 echo -- ▒▓▓▓▓или на странице мода на сайте Nexusmods:▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓https://www.nexusmods.com/warhammer40kdarktide/mods/139 ▓▓▓▓▓▓▓▒
	 echo -- ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒xsSplater▒
	 echo.)>mod_load_order.txt
) else (
	(echo -- ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	 echo -- ▒▓1. If you need to add a mod manually, enter the folder name of▓▓▓▓▒
	 echo -- ▒▓▓▓▓your mod below. Each new mod must be on a new line.▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓2. Order in the list determines the order in which mods are▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓loaded. The lower the mod, the higher the loading priority.▓▓▓▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓3. Do not rename the mod folder, because the folder names and▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓entries inside the files depend on this name.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓4. DO NOT list the "BASE" or "DMF" folders or you will get an▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓error in the game‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓5. If any mod got 'lost' during sorting and wasn't added to the▓▓▓▒
	 echo -- ▒▓▓▓▓list, please let me know on my Discord or on Nexusmods:▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓https://discord.gg/BGZagw3xnz ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	 echo -- ▒▓https://www.nexusmods.com/warhammer40kdarktide/mods/139?tab=posts▓▒
	 echo -- ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒xsSplater▒
	 echo.)>mod_load_order.txt
)

												call :LOG "Adding mandatory mods"
call :ADD_MANDATORY_MODS
												call :LOG "Adding remaining mods"  
call :ADD_REMAINING_MODS

goto :EOF


:ADD_MANDATORY_MODS
REM ╔═══════════════════════════════════════════════════╗
REM ║ SORTING RULES										║
REM ╠═══════════════════════════════════════════════════╣
REM ╟+ CharacterGrid									║
REM ╟+ LogMeIn											║
REM ╟+ Reconnect										║
REM ╟+ psych_ward										║
REM ╟+ DarktideLocalServer								║
REM ╟+ └─Audio											║
REM ╟+ animation_events									║
REM ╟+ └─scoreboard										║
REM ╟+	 ├─ScoreboardAmmos								║
REM ╟+	 ├─ScoreboardDamage								║
REM ╟+	 ├─scoreboard_enhanced_defense_plugin			║
REM ╟+	 ├─ScoreboardExplosive							║
REM ╟+	 ├─ScoreboardTagCounter							║
REM ╟+	 ├─ovenproof_scoreboard_plugin					║
REM ╟+	 └─scoreboard_vermintide_plugin					║
REM ╟+ ChatBlock										║
REM ╟+ master_item_community_patch						║
REM ╟+ MultiBind										║
REM ╟+ ToggleAltFire									║
REM ╟+ guarantee_ability_activation						║
REM ╟+ guarantee_weapon_swap							║
REM ╟+ guarantee_special_action							║
REM ╟+ hybrid_sprint									║
REM ╟+ Power_DI											║
REM ╟+ │true_level										║
REM ╟+ └┴─Do I Know You									║
REM ╟+ servo_friend										║
REM ╟+ ├─servo_friend_audio_server_plugin				║
REM ╟+ └─servo_friend_example_addon						║
REM ╟+ extended_weapon_customization					║
REM ╟+ │├─extended_weapon_customization_base_additions	║
REM ╟+ │├─extended_weapon_customization_owo				║
REM ╟+ │└─extended_weapon_customization_syn_edits		║
REM ╟+ └─for_the_drip									║
REM ╟+	 └─for_the_drip_extra							║
REM ╟+ who_are_you										║
REM ╚═══════════════════════════════════════════════════╝
if exist "CharacterGrid" echo CharacterGrid>> mod_load_order.txt
if exist "LogMeIn" echo LogMeIn>> mod_load_order.txt
if exist "Reconnect" echo Reconnect>> mod_load_order.txt
if exist "psych_ward" echo psych_ward>> mod_load_order.txt
if exist "DarktideLocalServer" echo DarktideLocalServer>> mod_load_order.txt
	if exist "Audio" echo Audio>> mod_load_order.txt
if exist "animation_events" echo animation_events>> mod_load_order.txt
	if exist "scoreboard" echo scoreboard>> mod_load_order.txt
		if exist "ScoreboardAmmos" echo ScoreboardAmmos>> mod_load_order.txt
		if exist "ScoreboardDamage" echo ScoreboardDamage>> mod_load_order.txt
		if exist "scoreboard_enhanced_defense_plugin" echo scoreboard_enhanced_defense_plugin>> mod_load_order.txt
		if exist "ScoreboardExplosive" echo ScoreboardExplosive>> mod_load_order.txt
		if exist "ScoreboardTagCounter" echo ScoreboardTagCounter>> mod_load_order.txt
		if exist "ovenproof_scoreboard_plugin" echo ovenproof_scoreboard_plugin>> mod_load_order.txt
		if exist "scoreboard_vermintide_plugin" echo scoreboard_vermintide_plugin>> mod_load_order.txt
if exist "ChatBlock" echo ChatBlock>> mod_load_order.txt
if exist "master_item_community_patch" echo master_item_community_patch>> mod_load_order.txt
if exist "MultiBind" echo MultiBind>> mod_load_order.txt
if exist "ToggleAltFire" echo ToggleAltFire>> mod_load_order.txt
if exist "guarantee_ability_activation" echo guarantee_ability_activation>> mod_load_order.txt
if exist "guarantee_weapon_swap" echo guarantee_weapon_swap>> mod_load_order.txt
if exist "guarantee_special_action" echo guarantee_special_action>> mod_load_order.txt
if exist "hybrid_sprint" echo hybrid_sprint>> mod_load_order.txt
if exist "Power_DI" echo Power_DI>> mod_load_order.txt
if exist "true_level" echo true_level>> mod_load_order.txt
	if exist "Do I Know You" echo Do I Know You>> mod_load_order.txt
if exist "servo_friend" echo servo_friend>> mod_load_order.txt
	if exist "servo_friend_audio_server_plugin" echo servo_friend_audio_server_plugin>> mod_load_order.txt
	if exist "servo_friend_example_addon" echo servo_friend_example_addon>> mod_load_order.txt
if exist "extended_weapon_customization" echo extended_weapon_customization>> mod_load_order.txt
	if exist "extended_weapon_customization_base_additions" echo extended_weapon_customization_base_additions>> mod_load_order.txt
	if exist "extended_weapon_customization_owo" echo extended_weapon_customization_owo>> mod_load_order.txt
	if exist "extended_weapon_customization_syn_edits" echo extended_weapon_customization_syn_edits>> mod_load_order.txt
	if exist "for_the_drip" echo for_the_drip>> mod_load_order.txt
	if exist "for_the_drip_extra" echo for_the_drip_extra>> mod_load_order.txt
if exist "who_are_you" echo who_are_you>> mod_load_order.txt

goto :EOF


:ADD_REMAINING_MODS
												call :LOG "Adding remaining mods in alphabetical order"
REM Очищаем временные переменные
for /f "delims==" %%v in ('set mydirs_ 2^>nul') do set "%%v="

REM Создаем временный файл с ИСКЛЮЧЕНИЯМИ
echo base> exclude.tmp
echo dmf>> exclude.tmp
echo CharacterGrid>> exclude.tmp
echo LogMeIn>> exclude.tmp
echo Reconnect>> exclude.tmp
echo psych_ward>> exclude.tmp
echo DarktideLocalServer>> exclude.tmp
echo Audio>> exclude.tmp
echo animation_events>> exclude.tmp
echo scoreboard>> exclude.tmp
echo ScoreboardAmmos>> exclude.tmp
echo ScoreboardDamage>> exclude.tmp
echo scoreboard_enhanced_defense_plugin>> exclude.tmp
echo ScoreboardExplosive>> exclude.tmp
echo ScoreboardTagCounter>> exclude.tmp
echo ovenproof_scoreboard_plugin>> exclude.tmp
echo scoreboard_vermintide_plugin>> exclude.tmp
echo ChatBlock>> exclude.tmp
echo master_item_community_patch>> exclude.tmp
echo MultiBind>> exclude.tmp
echo ToggleAltFire>> exclude.tmp
echo guarantee_ability_activation>> exclude.tmp
echo guarantee_weapon_swap>> exclude.tmp
echo guarantee_special_action>> exclude.tmp
echo hybrid_sprint>> exclude.tmp
echo Power_DI>> exclude.tmp
echo true_level>> exclude.tmp
echo Do I Know You>> exclude.tmp
echo servo_friend>> exclude.tmp
echo servo_friend_audio_server_plugin>> exclude.tmp
echo servo_friend_example_addon>> exclude.tmp
echo extended_weapon_customization>> exclude.tmp
echo extended_weapon_customization_base_additions>> exclude.tmp
echo extended_weapon_customization_owo>> exclude.tmp
echo extended_weapon_customization_syn_edits>> exclude.tmp
echo for_the_drip>> exclude.tmp
echo for_the_drip_extra>> exclude.tmp
echo who_are_you>> exclude.tmp

REM Используем файл для фильтрации
for /f "tokens=*" %%i in ('dir /b /ad ^| findstr /iv /g:exclude.tmp') do (
	set "mydirs_%%~snxi=%%~nxi" 2>nul
)
REM Удаляем временный файл
del exclude.tmp
REM Добавляем отсортированные моды в файл
for /f "tokens=2 delims== eol=" %%i in ('set mydirs_ 2^>nul') do (
	echo %%i>> mod_load_order.txt
												call :LOG "Added mod: %%i"
)
REM Очищаем временные переменные
for /f "delims==" %%v in ('set mydirs_ 2^>nul') do set "%%v="

goto :EOF


:IS_MOD_ALREADY_LISTED
set "ALREADY_LISTED=0"
for /f "usebackq delims=" %%j in ("mod_load_order.txt") do (
	if "%%j"=="%~1" set "ALREADY_LISTED=1"
)
goto :EOF



REM ███████████████████████████████████████████████████████████████████████████████████████████████████████████
REM █████DIALOGS AND CHECKS████████████████████████████████████████████████████████████████████████████████████
REM █████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM █████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
:SHOW_INSTALLATION_ERROR
set "MISSING_FOLDER=%~1"
set "MOD_NAME=%~2"
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓DARKTIDE MOD LOADER - в зависимости от языка выбираем специфический диалог▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if "!MISSING_FOLDER!"=="base" (
	set "NEXUS_PAGE_DMLF=start https://www.nexusmods.com/warhammer40kdarktide/mods/19"
	if "!LANGUAGE!"=="ru" (
															   set "MSG_SPACES=▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "OPT_DMLF__NEXUS=[N] - Доступ к реликварию «DARKTIDE MOD LOADER» [Nexus]...▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	) else (
																			 set "MSG_SPACES=▓▓▓▓▓▓▓▓▒░░███████"
	set "OPT_DMLF__NEXUS=[N] - Access the 'DARKTIDE MOD LOADER' reliquary [Nexus]...▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	))
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓DARKTIDE MOD FRAMEWORK - в зависимости от языка выбираем специфический диалог▓▓▓▓▓▓▓▓▓▒░░███████
if "!MISSING_FOLDER!"=="dmf" (
	set "NEXUS_PAGE_DMLF=start https://www.nexusmods.com/warhammer40kdarktide/mods/8"
	if "!LANGUAGE!"=="ru" (
																 set "MSG_SPACES=▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "OPT_DMLF__NEXUS=[N] - Доступ к реликварию «DARKTIDE MOD FRAMEWORK» [Nexus]...▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	) else (
																			   set "MSG_SPACES=▓▓▓▓▓▓▒░░███████"
	set "OPT_DMLF__NEXUS=[N] - Access the «DARKTIDE MOD FRAMEWORK» reliquary [Nexus]...▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ███████████████████████████████████████████████████████████████████████████████████████████████████████████
	))

	if "!LANGUAGE!"=="ru" (
		set "MSG_FLDR_BASE_NOT_FOUND=// Папка «!MISSING_FOLDER!» мода «!MOD_NAME!» не найдена‼"
	) else (
		set "MSG_FLDR_BASE_NOT_FOUND=// The "!MISSING_FOLDER!" folder of the "!MOD_NAME!" mod was not found‼"
	)

	cls
	REM mode con cols=100 lines=34
	color 0C
	REM Reddish 100х30
	echo ████████████████████████████████████████████████████████████████████████████████████████████████████
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ░░░░░░░░░░▒▓▓▓!MSG_SERVIT_ENGD!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ███▓▒▓▓█░░▒▓▓▓!MSG_CRIT_ERROR_!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ████████░░▒▓▓▓!MSG_FLDR_BASE_NOT_FOUND!!MSG_SPACES!
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo ██▓░░░░░░░▒▓▓▓!MSG_SRV_MQ_HERE!
	echo ▓░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ░░░█████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░▓█
	echo ▓░░░▒▒▒░░░▒▓▓▓!MSG_SELECT_ACTN!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo █████░░░░░▒▓▓▓!OPT_STEAM_GUIDE!
	echo █████░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███░░░░
	echo ████████░░▒▓▓▓!OPT_DMLF__NEXUS!
	echo ███▓▓▓██░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒▓▓▓!OPT_MAN_FL_EXIT!
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo ████████████████████████████████████████████████████████████████████████████████████████████████████
	echo.
		Choice /c SNQ
			If Errorlevel 3 (
				start .
				exit
			)
			If Errorlevel 2 !NEXUS_PAGE_DMLF! && exit
			If Errorlevel 1 !START_STEAM_GUIDE! && exit

	goto :EOF


	:SHOW_MOD_LOAD_ORDER_MISSING
													call :LOG "mod_load_order.txt not found‼"
	cls
	REM mode con cols=100 lines=34
	color 0C
	REM Reddish 100х30
	echo ████████████████████████████████████████████████████████████████████████████████████████████████████
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ░░░░░░░░░░▒▓▓▓!MSG_SERVIT_ENGD!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ███▓▒▓▓█░░▒▓▓▓!MSG_MLO_NOT_FND!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ████████░░▒▓▓▓!MSG_NEW_MLO_TXT!
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo ██▓░░░░░░░▒▓▓▓!MSG_SRV_MQ_HERE!
	echo ▓░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ░░░█████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░▓█
	echo ▓░░░▒▒▒░░░▒▓▓▓!MSG_SELECT_ACTN!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo █████░░░░░▒▓▓▓!OPT_CREATE_NEW_!
	echo █████░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███░░░░
	echo ████████░░▒▓▓▓!OPT_STEAM_GUIDE!
	echo ███▓▓▓██░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒▓▓▓!OPT_MAN_FL_EXIT!
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo ████████████████████████████████████████████████████████████████████████████████████████████████████
	echo.
		Choice /c CSQ
			If Errorlevel 3 (
				start .
				exit
			)
			If Errorlevel 2 !START_STEAM_GUIDE! && exit
			If Errorlevel 1 echo.>mod_load_order.txt && goto :STEP_2_CHECK_MOD_LOAD_ORDER

	goto :EOF


:CHECK_OBSOLETE_MODS
set "OBSOLETE_FOUND=0"
set "OBSOLETE_LIST="
set "FOUND_OBSOLETE_FOLDERS="
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒Список устаревших модов:▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
set "OBSOLETE_MODS=ads_crosshair AimSensitivity ammo_med_markers barter_at_once barter_with_hadron book_finder CharWallets chest_markers CircumstanceFix CombatEvolved consistent_flamer_backpacks contracts_overlay CThruShields DarkCache DirectToHadron emote_wheel_fix EnemyAudioReplacer ENLocalizationFIX ENLocalizationFIXAIO ENLocalizationFIXBlessings ENLocalizationFIXCurios ENLocalizationFIXTalents ENLocalizationFIXTraits fancy_bots graphics_options "Height Changer" heretical_idol_marker holier_revenant IgnorePsykerGrenades material_markers ModificationIconColor MuteInBackground MutePerilSounds NoSkull OpenSteamProfile PenanceDetails PlasmaGunLagFix PreferAuric PsykaniumDefaultDifficulty PsykerCriticalPerilQuiet RejectInvitesWhileInMission reroll_until_rarity RestoreRagdollInteraction RetainSelection reveal_blessings RULocalizationFIX RULocalizationFIXAchievements RULocalizationFIXBlessings RULocalizationFIXBlessnTalentsNames RULocalizationFIXCurios RULocalizationFIXEnemies RULocalizationFIXMenus RULocalizationFIXStores RULocalizationFIXTalents RULocalizationFIXTraits RULocalizationFIXTitles RULocalizationFIXWeaponnames x_Enhanced_RU_Localization settings_extension sorted_mission_grid SpaceToContinue SpectatorHUD TaintedDevices_markers TransparentShield TruePeril ui_extension weapon_customization weapon_customization_chains weapon_customization_mt_stuff weapon_customization_no_scope weapon_customization_owo weapon_customization_plugin weapon_customization_plugin_xsSythes weapon_customization_syn_edits which_book WhichMissions"

if "!LANGUAGE!"=="ru" (
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒Описания для каждого устаревшего мода:▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓▓Русский▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	set "ads_crosshair_desc=Устарел. Закрыт в пользу Crosshair Remap.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "AimSensitivity_desc=Устарел, исправлено ФШ.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ammo_med_markers_desc=Устарел. Часть мода Markers Improved All-In-One.▓▓▓▓▓▓▓▒░░███████"
	set "barter_at_once_desc=Устарел из-за изменения ФШ в игре системы продаж.▓▓▓▓▓▓▓▓▒░░███████"
	set "barter_with_hadron_desc=Устарел из-за изменения в игре системы продаж.▓▓▓▓▓▓▓▒░░███████"
	set "book_finder_desc=Устарел. Закрыт в пользу Collectible Finder.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CharWallets_desc=Устарел. Закрыт в пользу Character Screen Contracts.▓▓▓▓▓▓▓▓▒░░███████"
	set "chest_markers_desc=Устарел. Часть мода Markers Improved All-In-One.▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CircumstanceFix_desc= Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CombatEvolved_desc= Не обновляется.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "consistent_flamer_backpacks_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "contracts_overlay_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CThruShields_desc=Устарел. Используйте VeilShield.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "DarkCache_desc=Не обновляется.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "DirectToHadron_desc=Устарел. Закрыт в пользу GoToMastery.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "emote_wheel_fix_desc=Устарел, исправлено ФШ.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "EnemyAudioReplacer_desc=Не обновляется.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIX_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXAIO_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXBlessings_desc=Используйте Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXCurios_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXTalents_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▒░░███████"
	set "ENLocalizationFIXTraits_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▒░░███████"
	set "fancy_bots_desc=Не обновляется.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "graphics_options_desc=Не обновляется. Используйте More Graphic Options.▓▓▓▓▓▓▒░░███████"
	set "Height Changer_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "heretical_idol_marker_desc=Устарел. Часть мода Markers Improved All-In-One.▓▓▒░░███████"
	set "IgnorePsykerGrenades_desc=Устарел, исправлено ФШ.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "material_markers_desc=Устарел. Часть мода Markers Improved All-In-One.▓▓▓▓▓▓▓▒░░███████"
	set "ModificationIconColor_desc=Устарел из-за изменения в игре системы крафта.▓▓▓▓▒░░███████"
	set "MuteInBackground_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MutePerilSounds_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "NoSkull_desc=Не обновляется. Используйте NumericUI вместо него.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "OpenSteamProfile_desc=Устарел. Закрыт в пользу Open Player Profile.▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PenanceDetails_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PlasmaGunLagFix_desc=Устарел, исправлено ФШ.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PreferAuric_desc=Устарел.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PsykaniumDefaultDifficulty_desc=Устарел.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PsykerCriticalPerilQuiet_desc=Не обновляется.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RejectInvitesWhileInMission_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "reroll_until_rarity_desc=Устарел из-за изменения системы крафта в игре.▓▓▓▓▓▓▒░░███████"
	set "RestoreRagdollInteraction_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RetainSelection_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "reveal_blessings_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIX_desc=Используйте Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXAchievements_desc=Используйте Enhanced Descriptions.▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXBlessings_desc=Устарел. Используйте Enhanced Descriptions.▓▓▒░░███████"
	set "RULocalizationFIXBlessnTalentsNames_desc=Используйте Enhanced Descriptions.▓▓▒░░███████"
	set "RULocalizationFIXCurios_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXEnemies_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▒░░███████"
	set "RULocalizationFIXMenus_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXStores_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXTalents_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▒░░███████"
	set "RULocalizationFIXTraits_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXTitles_desc=Устарел. Используйте Enhanced Descriptions.▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXWeaponnames_desc=Используйте Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▒░░███████"
	set "x_Enhanced_RU_Localization_desc=Устарел. Используйте Enhanced Descriptions.▓▓▒░░███████"
	set "settings_extension_desc=Нужен только для устаревшего Graphics Options.▓▓▓▓▓▓▓▒░░███████"
	set "sorted_mission_grid_desc=Устарел. Используйте новый мод MissionGrid.▓▓▓▓▓▓▓▓▓▒░░███████"
	set "SpaceToContinue_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "SpectatorHUD_desc=Устарел, введено ФШ в игру.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "stimm_markers_desc=Устарел. Часть мода Markers Improved All-In-One.▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "TaintedDevices_markers_desc=Устарел.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "tome_markers_desc=Устарел. Часть мода Markers Improved All-In-One.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "TransparentShield_desc=Устарел. Используйте VeilShield.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "TruePeril_desc=Устарел. Закрыт в пользу PerilGauge.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ui_extension_desc=Не нужен ни для чего.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_desc=Новая версия - Extended Weapon Customization.▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_chains_desc=Устарел. Ищите новую версию.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_plugin_desc=Устарел.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_mt_stuff_desc=Устарел. Ищите новую версию.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_owo_desc=Устарел. Ищите новую версию.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_no_scope_desc=Устарел. Ищите новую версию.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_syn_edits_desc=Устарел. Ищите новую версию.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "which_book_desc=Устарел. Новая версия - Distinct Side Mission Icons.▓▓▓▓▓▓▓▓▓▒░░███████"
	set "WhichMissions_desc=Устарел. Закрыт в пользу устаревшего Penance Details.▓▓▓▓▓▒░░███████"
) else (
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓▓English▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	set "ads_crosshair_desc=Deprecated. Closed in favor of Crosshair Remap.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "AimSensitivity_desc=Obsolete, fixed by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ammo_med_markers_desc=Deprecated. Part of the Markers Improved AIO.▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "barter_at_once_desc=Obsolete due to changes in-game system in Arsenal.▓▓▓▓▓▓▓▒░░███████"
	set "barter_with_hadron_desc=Obsolete due to changes in-game system in Arsenal.▓▓▓▒░░███████"
	set "book_finder_desc=Deprecated. Closed in favor of Collectible Finder.▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CharWallets_desc=Deprecated. Closed in favor of Character Screen Contracts.▓▓▒░░███████"
	set "chest_markers_desc=Deprecated. Part of the Markers Improved AIO.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CircumstanceFix_desc= Deprecated, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CombatEvolved_desc= Not updating.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "consistent_flamer_backpacks_desc=Obsolete, introduced into the game by FS.▓▓▓▒░░███████"
	set "contracts_overlay_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "CThruShields_desc=Deprecated. Use VeilShield.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "DarkCache_desc=Not updating.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "DirectToHadron_desc=Deprecated. Closed in favor of GoToMastery.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "emote_wheel_fix_desc=Obsolete, fixed by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "EnemyAudioReplacer_desc=Not updating.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIX_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXAIO_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXBlessings_desc=Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXCurios_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXTalents_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ENLocalizationFIXTraits_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "graphics_options_desc=Deprecated. Use More Graphic Options.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "fancy_bots_desc=Не обновляется.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "Height Changer_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "heretical_idol_marker_desc=Deprecated. Part of the Markers Improved AIO.▓▓▓▓▓▒░░███████"
	set "IgnorePsykerGrenades_desc=Obsolete, fixed by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "material_markers_desc=Deprecated. Part of the Markers Improved AIO.▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ModificationIconColor_desc=Deprecated due to changes in the crafting system.▓▒░░███████"
	set "MuteInBackground_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "MutePerilSounds_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "NoSkull_desc=Not updating. Use Numeric UI.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "OpenSteamProfile_desc=Deprecated. Closed in favor of Open Player Profile.▓▓▓▓▒░░███████"
	set "PenanceDetails_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PlasmaGunLagFix_desc=Obsolete, fixed by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PreferAuric_desc=Obsolete.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PsykaniumDefaultDifficulty_desc=Obsolete.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "PsykerCriticalPerilQuiet_desc=Not updating.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RejectInvitesWhileInMission_desc=Obsolete, introduced into the game by FS.▓▓▓▒░░███████"
	set "reroll_until_rarity_desc=Deprecated due to changes in the crafting system.▓▓▓▒░░███████"
	set "RestoreRagdollInteraction_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▒░░███████"
	set "RetainSelection_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "reveal_blessings_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIX_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXAchievements_desc=Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXBlessings_desc=Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXBlessnTalentsNames_desc=Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXCurios_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXEnemies_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXMenus_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXStores_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXTalents_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXTraits_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXTitles_desc=Obsolete. Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "RULocalizationFIXWeaponnames_desc=Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "x_Enhanced_RU_Localization_desc=Use Enhanced Descriptions.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "settings_extension_desc=Only needed for outdated Graphics Options.▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "sorted_mission_grid_desc=Deprecated. Use new MissionGrid mod instead.▓▓▓▓▓▓▓▓▒░░███████"
	set "SpaceToContinue_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "SpectatorHUD_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "stimm_markers_desc=Deprecated. Part of the Markers Improved AIO.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "TaintedDevices_markers_desc=Deprecated.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "tome_markers_desc=Deprecated. Part of the Markers Improved AIO.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "TransparentShield_desc=Deprecated. Use VeilShield.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "TruePeril_desc=Deprecated. Closed in favor of PerilGauge.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "ui_extension_desc=Not needed for anything.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_desc=The new version - Extended Weapon Customization.▓▓▓▒░░███████"
	set "weapon_customization_chains_desc=Deprecated. Look for a new version.▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_plugin_desc=Deprecated.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_mt_stuff_desc=Deprecated. Look for a new version.▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_owo_desc=Deprecated. Look for a new version.▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_no_scope_desc=Deprecated. Look for a new version.▓▓▓▓▓▓▓▒░░███████"
	set "weapon_customization_syn_edits_desc=Deprecated. Look for a new version.▓▓▓▓▓▓▒░░███████"
	set "which_book_desc=Deprecated. The new version - Distinct Side Mission Icons.▓▓▓▒░░███████"
	set "WhichMissions_desc=Obsolete, introduced into the game by FS.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████████████████████████████████████████████████████████████████████████████████████████████
)

REM Check for folders
for %%f in (%OBSOLETE_MODS%) do (
	if exist "%%~f\" (
		set "OBSOLETE_FOUND=1"
		set "OBSOLETE_LIST=!OBSOLETE_LIST!%%~f "
		set "FOUND_OBSOLETE_FOLDERS=!FOUND_OBSOLETE_FOLDERS! "%%~f""
	)
)
goto :EOF

	:SHOW_OBSOLETE_MODS_WARNING
	if "!OBSOLETE_FOUND!"=="0" goto :EOF

	cls
	REM mode con cols=100 lines=34
	color 0C
	REM Reddish
	echo ████████████████████████████████████████████████████████████████████████████████████████████████████
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ░░░░░░░░░░▒▓▓▓!MSG_SERVIT_ENGD!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ███▓▒▓▓█░░▒▓▓▓!MSG_____WARNING!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ████████░░▒▓▓▓!MSG_DEPRCTD_FND!
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▓▓▒░░
		 for %%f in (%OBSOLETE_MODS%) do ( if exist "%%~f\" ( call set "desc=%%%%~f_desc%%%"
	echo ██▓░░░░░░░▒▓▓▓[%%~f] - !desc!))
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ░░░█████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░▓█
	echo ▓░░░▒▒▒░░░▒▓▓▓!MSG_SELECT_ACTN!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo █████░░░░░▒▓▓▓!OPT_CONTINUE_NO!
	echo █████░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███░░░░
	echo ████████░░▒▓▓▓!OPT_DEL_DEPRCTD!
	echo ███▓▓▓██░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒▓▓▓!OPT_MAN_FL_EXIT!
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo.
		Choice /c CDQ
			If Errorlevel 3 (
				start .
				exit
			)
			If Errorlevel 2 call :DELETE_OBSOLETE_MODS && goto :STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
			If Errorlevel 1 (
				set "OBSOLETE_FOUND=0"
													call :LOG "OBSOLETE==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼"
				goto :STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
			)

	goto :EOF

	:DELETE_OBSOLETE_MODS
	for %%f in (%OBSOLETE_MODS%) do (
		if exist "%%~f\" (
													call :LOG "Deleting obsolete mod: %%~f"
			rmdir /s /q "%%~f"
		)
	)
													call :LOG "Obsolete mods deletion completed"
	goto :EOF


:CHECK_MALFORMED_MODS
set "MALFORMED_FOUND=0"
set "MALFORMED_LIST="
REM Check for folders with Nexus-style numeric suffixes
for /d %%f in (*-*-*-*-*) do (
	if exist "%%f\" (
		set "MALFORMED_FOUND=1"
		set "MALFORMED_LIST=!MALFORMED_LIST!%%~f "
	)
)

	:SHOW_MALFORMED_MODS_WARNING
	if "!MALFORMED_FOUND!"=="0" goto :EOF

	cls
	REM mode con cols=100 lines=34
	color 0C
	REM Reddish
	echo ████████████████████████████████████████████████████████████████████████████████████████████████████
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ░░░░░░░░░░▒▓▓▓!MSG_SERVIT_ENGD!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ███▓▒▓▓█░░▒▓▓▓!MSG_____WARNING!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ████████░░▒▓▓▓!MSG_WRNG_UNPCKD!
	echo █████▓▒░░░▒▓▓▓!MSG_WRNG_UNPCK2!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓№!▓▓▓#▓▓▓^%▓▓▓@░░█^&7█▓
		 for %%f in (!MALFORMED_LIST!) do (
	echo ██▓░░░░░░░▒▓▓▓%%~f )
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓$▓▓▒░░'██;██
	echo █░░░░░░░░░▒▓▓▓!MSG_CLEAR_FLDR1!
	echo █░░░░░░░░░▒▓▓▓!MSG_CLEAR_FLDR2!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░████░░░
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░████░░░
	echo █████░░░░░▒▓▓▓!MSG_SELECT_ACTN!
	echo █████░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███░░░░
	echo ████████░░▒▓▓▓!OPT_CONTINUE_NO!
	echo ███▓▓▓██░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒▓▓▓!OPT_MAN_FL_EXIT!
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓2▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░█0█████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒1▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░4░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░30░░░░░░░░░░░░1░░░░▓▓▓▓▓▓▓
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░3░░░░░░░░░░░░░░░░░░░░░░░███████
	echo.
		Choice /c CQ
			If Errorlevel 2 (
				start .
				exit
			)
			If Errorlevel 1 (
				set "MALFORMED_FOUND=0"
													call :LOG "MALFORMED==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼"
				goto :STEP_3B_CHECK_EMPTY_FOLDERS
			)

	goto :EOF


:CHECK_EMPTY_FOLDERS
set "EMPTY_FOUND=0"
set "EMPTY_LIST="
for /d %%f in (*) do (
	if exist "%%f\" (
		dir "%%f" /b /a | findstr . >nul
		if errorlevel 1 (
			set "EMPTY_FOUND=1"
			set "EMPTY_LIST=!EMPTY_LIST!%%~f "
												call :LOG "Empty folder found: %%~f"
		)
	)
)

goto :EOF

	:SHOW_EMPTY_FOLDERS_WARNING
	if "!EMPTY_FOUND!"=="0" goto :EOF

	cls
	REM mode con cols=100 lines=34
	color 0C
	REM Reddish
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ░░░░░░░░░░▒▓▓▓!MSG_SERVIT_ENGD!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ███▓▒▓▓█░░▒▓▓▓!MSG_____WARNING!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ████████░░▒▓▓▓!MSG_EMPTY_F_FND!
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▓▓▒░░
		 for %%f in (!EMPTY_LIST!) do (
	echo ██▓░░░░░░░▒▓▓▓%%~f )
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ░░░█████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░▓█
	echo █░░░░░░░░░▒▓▓▓!MSG_CLEAR_FLDR1!
	echo █░░░░░░░░░▒▓▓▓!MSG_CLEAR_FLDR2!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo █████░░░░░▒▓▓▓!MSG_SELECT_ACTN!
	echo █████░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███░░░░
	echo ████████░░▒▓▓▓!OPT_CONTINUE_NO!
	echo ███▓▓▓██░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒▓▓▓!OPT_MAN_FL_EXIT!
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo.
		Choice /c CQ
			If Errorlevel 2 (
				start .
				exit
			)
			If Errorlevel 1 (
				set "EMPTY_FOUND=0"
													call :LOG "EMPTY==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼"
				goto :STEP_4_CHECK_INCOMPATIBLE_MODS
			)

	goto :EOF


:CHECK_INCOMPATIBLE_MODS
set "INCOMPATIBLE_FOUND=0"
set "CONFLICT_PAIRS="

		REM ███████████████████████████████████████████████████████████████████████████████████████████████
		REM ████MOD COMPATIBILITY██████████████████████████████████████████████████████████████████████████
		REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
		REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
		REM ████░░▒▓▓Numeric UI VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Remove Tag Skulls▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "NumericUI\" if exist "RemoveTagSkulls\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=RemoveTagSkulls" && set "MOD1_Name=Remove Tag Skulls"
	set "MOD2=NumericUI" && set "MOD2_Name=Numeric UI"
	if "!LANGUAGE!"=="ru" (
			   set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Remove Tag Skulls▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Numeric UI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
			   set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Remove Tag Skulls▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Numeric UI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Skitarius VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Unga Bunga▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Keep Swinging▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Full Auto▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "Skitarius\" if exist "UngaBunga\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=UngaBunga" && set "MOD1_Name=Unga Bunga"
	set "MOD2=Skitarius" && set "MOD2_Name=Skitarius"
	if "!LANGUAGE!"=="ru" (
	   set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	   set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Unga Bunga▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
	   set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	   set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Unga Bunga▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
if exist "Skitarius\" if exist "KeepSwinging\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=KeepSwinging" && set "MOD1_Name=Keep Swinging"
	set "MOD2=Skitarius" && set "MOD2_Name=Skitarius"
	if "!LANGUAGE!"=="ru" (
		  set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		  set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Keep Swinging▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
		  set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		  set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Keep Swinging▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
if exist "Skitarius\" if exist "FullAuto\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=FullAuto" && set "MOD1_Name=Full Auto"
	set "MOD2=Skitarius" && set "MOD2_Name=Skitarius"
	if "!LANGUAGE!"=="ru" (
	  set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	  set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Full Auto▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
	  set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	  set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Full Auto▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Custom HUD VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─None HUD▓▓▓▓*уже нет на Нексусе▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "custom_hud\" if exist "ToggleHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=ToggleHUD" && set "MOD1_Name=Toggle HUD"
	set "MOD2=custom_hud" && set "MOD2_Name=Custom HUD"
	if "!LANGUAGE!"=="ru" (
		set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2=В «!MOD2_Name!», помимо прочего, можно отключать интерфейс клавишей F2.▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
		set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2=In '!MOD2_Name!', you can also disable the interface by pressing F2.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
if exist "custom_hud\" if exist "NoneHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=NoneHUD" && set "MOD1_Name=None HUD"
	set "MOD2=custom_hud" && set "MOD2_Name=Custom HUD"
	if "!LANGUAGE!"=="ru" (
	  set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2=В «!MOD2_Name!», помимо прочего, можно отключать интерфейс клавишей F2.▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
	  set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2=In '!MOD2_Name!', you can also disable the interface by pressing F2.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Toggle HUD VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─None HUD▓▓▓▓*уже нет на Нексусе▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ToggleHUD\" if exist "NoneHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=NoneHUD" && set "MOD1_Name=None HUD"
	set "MOD2=ToggleHUD" && set "MOD2_Name=Toggle HUD"
	if "!LANGUAGE!"=="ru" (
	  set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2=«!MOD2_Name!»имеет ту же функциональность, что и «!MOD1_Name!».▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
	  set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	  set "DESC2='!MOD2_Name!' has the same functionality as '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Solo Play VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Prologue▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "SoloPlay\" if exist "prologue\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=prologue" && set "MOD1_Name=Prologue"
	set "MOD2=SoloPlay" && set "MOD2_Name=Solo Play"
	if "!LANGUAGE!"=="ru" (
	 set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	 set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Prologue▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Solo Play▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
	 set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	 set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Prologue▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Solo Play▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Display Ping VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Ping Monitor▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "DisplayPing\" if exist "PingMonitor\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=PingMonitor" && set "MOD1_Name=Ping Monitor"
	set "MOD2=DisplayPing" && set "MOD2_Name=Display Ping"
	if "!LANGUAGE!"=="ru" (
			set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Ping Monitor▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Display Ping▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
			set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Ping Monitor▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Display Ping▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Show Weapons In Lobby VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Mission Lobby - Show Ranged Weapons▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ShowEquippedInLobby\" if exist "Mission Lobby - Show Ranged Weapons\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Mission Lobby - Show Ranged Weapons" && set "MOD1_Name=Mission Lobby - Show Ranged Weapons"
	set "MOD2=ShowEquippedInLobby" && set "MOD2_Name=Show Weapons in Lobby"
	if "!LANGUAGE!"=="ru" (
											set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы▒░░▓▓▒░░░░"
		  set "DESC2=Оба мода имеют схожую функциональность.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Mission Lobby - Show Ranged Weapons▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Show Weapons in Lobby▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
											set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		  set "DESC2=incompatible‼ Both mods have similar functionality.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Mission Lobby - Show Ranged Weapons▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Show Weapons in Lobby▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Markers Improved All-in-One VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Found Ya▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Ration Pack▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Stimms Pickup Icon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "markers_aio\" if exist "FoundYa\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=FoundYa" && set "MOD1_Name=Found Ya"
	set "MOD2=markers_aio" && set "MOD2_Name=Markers Improved All-In-One" && set "MOD2_Name3=Markers Improved AIO"
	if "!LANGUAGE!"=="ru" (
					   set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Found Ya▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
					   set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "DESC2='!MOD2_Name3!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Found Ya▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
if exist "markers_aio\" if exist "Ration Pack\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Ration Pack" && set "MOD1_Name=Ration Pack"
	set "MOD2=markers_aio" && set "MOD2_Name=Markers Improved All-In-One" && set "MOD2_Name3=Markers Improved AIO"
	if "!LANGUAGE!"=="ru" (
						  set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Ration Pack▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
						  set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "DESC2='!MOD2_Name3!' already includes all functionality of '!MOD1_Name!'.▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Ration Pack▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
if exist "markers_aio\" if exist "StimmsPickupIcon\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=StimmsPickupIcon" && set "MOD1_Name=Stimms Pickup Icon"
	set "MOD2=markers_aio" && set "MOD2_Name=Markers Improved All-In-One" && set "MOD2_Name3=Markers Improved AIO"
	if "!LANGUAGE!"=="ru" (
								 set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "DESC2=«!MOD2_Name3!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Stimms Pickup Icon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
			set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▒░░▓▓▒░░░░"
			set "DESC2='!MOD2_Name3!' includes all functionality of '!MOD1_Name!'.▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Stimms Pickup Icon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Teammate Tracker VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "teammate_tracker\" if exist "Do I Know You\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Do I Know You" && set "MOD1_Name=Do I Know You"
	set "MOD2=teammate_tracker" && set "MOD2_Name=Teammate Tracker"
	if "!LANGUAGE!"=="ru" (
				 set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Teammate Tracker▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
				 set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Teammate Tracker▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Better Loadouts VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─More Characters and Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "BetterLoadouts\" if exist "more_characters_and_loadouts\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=more_characters_and_loadouts" && set "MOD1_Name=More Characters and Loadouts"
	set "MOD2=BetterLoadouts" && set "MOD2_Name=Better Loadouts"
	if "!LANGUAGE!"=="ru" (
							   set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
							   set "DESC2=«!MOD2_Name!» имеет в себе функционал «!MOD1_Name!».▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=More Characters and Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Better Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
							   set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▒░░▓▓▒░░░░"
							   set "DESC2='!MOD2_Name!' includes functionality of '!MOD1_Name!'.▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=More Characters and Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Better Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Simple Color Selector VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Color Selection▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "simplecolorselector\" if exist "ColorSelection\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=ColorSelection" && set "MOD1_Name=Color Selection"
	set "MOD2=simplecolorselector" && set "MOD2_Name=Simple Color Selector"
	if "!LANGUAGE!"=="ru" (
						set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						set "DESC2=«!MOD2_Name!» имеет в себе функционал «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD1_Name2=Color Selection▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD2_Name2=Simple Color Selector▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
						set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						set "DESC2='!MOD2_Name!' includes functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD1_Name2=Color Selection▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						  set "MOD2_Name2=Simple Color Selector▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	goto :EOF
)

goto :EOF

	:SHOW_INCOMPATIBLE_MODS_ERROR
	if "!INCOMPATIBLE_FOUND!"=="0" goto :EOF

	if "!LANGUAGE!"=="ru" (
		set "OPT_DEL_CONFL_1=[F] - Удали мод: !MOD1_Name2!"
		set "OPT_DEL_CONFL_2=[S] - Удали мод: !MOD2_Name2!"
	) else (
		set "OPT_DEL_CONFL_1=[F] - Purge the mod: !MOD1_Name2!"
		set "OPT_DEL_CONFL_2=[S] - Purge the mod: !MOD2_Name2!"
	)

	cls
	REM mode con cols=100 lines=34
	color 0C
	echo.
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ░░░░░░░░░░▒▓▓▓!MSG_SERVIT_ENGD!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ███▓▒▓▓█░░▒▓▓▓!MSG_CNFLCT_FND1!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ████████░░▒▓▓▓!MSG_CNFLCT_FND2!
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo ██▓░░░░░░░▒▓▓▓!DESC1!
	echo ██▓░░░░░░░▒▓▓▓!DESC2!
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ░░░█████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░▓█
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ▓░░░░░░░░░▒▓▓▓!MSG_SELECT_ACTN!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo █████░░░░░▒▓▓▓!OPT_CONTINUE_NO!
	echo █████░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███░░░░
	echo ████████░░▒▓▓▓!OPT_DEL_CONFL_1!
	echo ████████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░
	echo ███▓▓▓██░░▒▓▓▓!OPT_DEL_CONFL_2!
	echo ███▓▓▓██░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒▓▓▓!OPT_MAN_FL_EXIT!
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo.
	Choice /c CFSQ
		If Errorlevel 4 (
				start .
				exit
			)
		If Errorlevel 3 (
			if exist "!MOD2!\" (
													call :LOG "Deleting mod: !MOD2_Name!"
				rmdir /s /q "!MOD2!"
			)
			goto :CONFLICTS_RESOLVED
		)
		If Errorlevel 2 (
			if exist "!MOD1!\" (
													call :LOG "Deleting mod: !MOD1_Name!"
				rmdir /s /q "!MOD1!"
			)
			goto :CONFLICTS_RESOLVED
		)
		If Errorlevel 1 (
			set "INCOMPATIBLE_FOUND=0"
													call :LOG "INCOMPATIBLE_FOUND==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼"
			goto :STEP_5_CHECK_DEPENDENCIES
		)

goto :EOF

:CONFLICTS_RESOLVED
set "INCOMPATIBLE_FOUND=0"
goto :STEP_4_CHECK_INCOMPATIBLE_MODS


:CHECK_DEPENDENCIES
REM ╔═══════════════════════════════════════════════════╗
REM ║ SORTING RULES										║
REM ╠═══════════════════════════════════════════════════╣
REM ╟+ DarktideLocalServer								║
REM ╟+ └─Audio											║
REM ╟+ animation_events									║
REM ╟+ └─scoreboard										║
REM ╟+	 ├─ScoreboardAmmos								║
REM ╟+	 ├─ScoreboardDamage								║
REM ╟+	 ├─scoreboard_enhanced_defense_plugin			║
REM ╟+	 ├─ScoreboardExplosive							║
REM ╟+	 ├─ScoreboardTagCounter							║
REM ╟+	 ├─ovenproof_scoreboard_plugin					║
REM ╟+	 └─scoreboard_vermintide_plugin					║
REM ╟+ Power_DI											║
REM ╟+ │true_level										║
REM ╟+ └┴─Do I Know You									║
REM ╟+ servo_friend										║
REM ╟+ ├─servo_friend_audio_server_plugin				║
REM ╟+ └─servo_friend_example_addon						║
REM ╟+ extended_weapon_customization					║
REM ╟+ │├─extended_weapon_customization_base_additions	║
REM ╟+ │├─extended_weapon_customization_owo				║
REM ╟+ │└─extended_weapon_customization_syn_edits		║
REM ╟+ └─for_the_drip									║
REM ╟+	 └─for_the_drip_extra							║
REM ╚═══════════════════════════════════════════════════╝

		REM ███████████████████████████████████████████████████████████████████████████████████████████████
		REM ████MOD DEPENDENCIES███████████████████████████████████████████████████████████████████████████
		REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
		REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
		REM ████░░▒▓▓Darktide Local Server▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Audio▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "Audio" if NOT exist "DarktideLocalServer" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Audio requires Darktide Local Server"
	set "MOD_Dep=Audio"
	set "MOD_Req=DarktideLocalServer" && set "MOD_Req_Name=Darktide Local Server"
	if "!LANGUAGE!"=="ru" (
		 set "DESC_Dep1=Моду «!MOD_Dep!» необходим для работы мод «!MOD_Req_Name!». Установите▓▓▓▒░░▓▓▒░░░░"
		 set "DESC_Dep2=«!MOD_Req_Name!» или удалите мод «!MOD_Dep!» во избежание ошибок.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
								set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=!MOD_Dep!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
		 set "DESC_Dep1='!MOD_Dep!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
							  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=!MOD_Dep!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/211"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Animation events▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM if exist "scoreboard" if NOT exist "animation_events" (
	REM set "DEPENDENCY_ERROR=1"
												REM call :LOG "Dependency error: Scoreboard requires Animation events"
	REM set "MOD_Dep=scoreboard" && set "MOD_Dep_Name=Scoreboard"
	REM set "MOD_Req=animation_events" && set "MOD_Req_Name=Animation events"
	REM if "!LANGUAGE!"=="ru" (
REM set "DESC_Dep1=«!MOD_Dep_Name!» не будет показывать некоторые подсчёты без «!MOD_Req_Name!».▓▒░░▓▓▒░░░░"
	  REM set "DESC_Dep2=Ошибок быть не должно, так что решай сам - устанавливать его или нет.▓▓▓▒░░▓▓▒░░░░"
						 REM set "MOD_Req_Name2=Animation events▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   REM set "MOD_Dep_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	REM ) else (
	REM set "DESC_Dep1='!MOD_Dep_Name!' has reduced functionality without '!MOD_Req_Name!'.▓▓▓▓▓▓▒░░▓▓▒░░░░"
	REM set "DESC_Dep2=No errors expected - install at your own discretion.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   REM set "MOD_Req_Name2=Animation events▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   REM set "MOD_Dep_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	REM )
	REM set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/21"
	REM call :SHOW_SINGLE_DEPENDENCY_ERROR
REM )
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Scoreboard Ammunitions picked▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Scoreboard Damage▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Scoreboard Enhanced Defense Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Scoreboard Explosive▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Scoreboard Tag Counter▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Ovenproof's Scoreboard Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Vermintide Scoreboard plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ScoreboardAmmos" if NOT exist "scoreboard" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Scoreboard Ammunitions picked requires Scoreboard"
	set "MOD_Dep=ScoreboardAmmos" && set "MOD_Dep_Name=Scoreboard Ammunitions picked" && set "MOD_Dep_Name3=SB Ammunitions picked"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
	if "!LANGUAGE!"=="ru" (
				 set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▓▒░░▓▓▒░░░░"
					 set "DESC_Dep2=его или удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▒░░▓▓▒░░░░"
					 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
								  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
		set "DESC_Dep1='!MOD_Dep_Name3!' requires the '!MOD_Req_Name!' mod to function properly.▓▒░░▓▓▒░░░░"
		set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name3!' to avoid errors.▓▓▓▓▓▒░░▓▓▒░░░░"
				   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
									  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "ScoreboardDamage" if NOT exist "scoreboard" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Scoreboard Damage requires Scoreboard"
	set "MOD_Dep=ScoreboardDamage" && set "MOD_Dep_Name=Scoreboard Damage"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
	if "!LANGUAGE!"=="ru" (
	 set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите его или▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC_Dep2=удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
					  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
	 set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▒░░▓▓▒░░░░"
	 set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
						  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "scoreboard_enhanced_defense_plugin" if NOT exist "scoreboard" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Scoreboard Enhanced Defense Plugin requires Scoreboard"
	set "MOD_Dep=scoreboard_enhanced_defense_plugin" && set "MOD_Dep_Name=Scoreboard Enhanced Defense Plugin" && set "MOD_Dep_Name3=SB Enhanced Defense Plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
	if "!LANGUAGE!"=="ru" (
					  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». ▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC_Dep2=Установите его или удалите «!MOD_Dep_Name3!» во избежание ошибок.▒░░▓▓▒░░░░"
					 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
									   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
					  set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			 set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name3!' to avoid errors.▒░░▓▓▒░░░░"
				   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
										   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "ScoreboardExplosive" if NOT exist "scoreboard" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Scoreboard Explosive requires Scoreboard"
	set "MOD_Dep=ScoreboardExplosive" && set "MOD_Dep_Name=Scoreboard Explosive"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
	if "!LANGUAGE!"=="ru" (
		set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите его▓▓▒░░▓▓▒░░░░"
			set "DESC_Dep2=или удалите «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
						 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
		set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▒░░▓▓▒░░░░"
		set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▒░░▓▓▒░░░░"
				   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
							 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "ScoreboardTagCounter" if NOT exist "scoreboard" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Scoreboard Tag Counter requires Scoreboard"
	set "MOD_Dep=ScoreboardTagCounter" && set "MOD_Dep_Name=Scoreboard Tag Counter"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
	if "!LANGUAGE!"=="ru" (
		  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите▓▓▓▓▒░░▓▓▒░░░░"
			  set "DESC_Dep2=его или удалите «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=Scoreboard Tag Counter▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
		  set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▒░░▓▓▒░░░░"
		  set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=Scoreboard Tag Counter▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "ovenproof_scoreboard_plugin" if NOT exist "scoreboard" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Ovenproof's Scoreboard Plugin requires Scoreboard"
	set "MOD_Dep=ovenproof_scoreboard_plugin" && set "MOD_Dep_Name=Ovenproof's Scoreboard Plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
	if "!LANGUAGE!"=="ru" (
				 set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▓▒░░▓▓▒░░░░"
					 set "DESC_Dep2=его или удалите «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=Ovenproof's Scoreboard Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
				 set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					 set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=Ovenproof's Scoreboard Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "scoreboard_vermintide_plugin" if NOT exist "scoreboard" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Vermintide Scoreboard plugin requires Scoreboard"
	set "MOD_Dep=scoreboard_vermintide_plugin" && set "MOD_Dep_Name=Vermintide Scoreboard plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
	if "!LANGUAGE!"=="ru" (
				set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▓▓▒░░▓▓▒░░░░"
					set "DESC_Dep2=его или удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=Vermintide Scoreboard plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
				set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=Vermintide Scoreboard plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Power DI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓│True Level▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└┴─Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "Do I Know You" if NOT exist "Power_DI" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Do I Know You requires Power DI"
	set "MOD_Dep=Do I Know You" && set "MOD_Dep_Name=Do I Know You"
	set "MOD_Req=Power_DI" && set "MOD_Req_Name=Power DI"
	if "!LANGUAGE!"=="ru" (
set "DESC_Dep1=Мод «!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите его или▓▓▓▒░░▓▓▒░░░░"
	 set "DESC_Dep2=удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "MOD_Req_Name2=Power DI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=Power DI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/281"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "Do I Know You" if NOT exist "true_level" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Do I Know You requires True Level"
	set "MOD_Dep=Do I Know You" && set "MOD_Dep_Name=Do I Know You"
	set "MOD_Req=true_level" && set "MOD_Req_Name=True Level"
	if "!LANGUAGE!"=="ru" (
 set "DESC_Dep1=Мод «!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите его или▓▒░░▓▓▒░░░░"
	 set "DESC_Dep2=удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "MOD_Req_Name2=True Level▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
 set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=True Level▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/156"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓├─Servo Friend Audio Server Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─Servo Friend Example Addon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "servo_friend_audio_server_plugin" if NOT exist "servo_friend" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Servo Friend Audio Server Plugin requires Servo Friend"
	set "MOD_Dep=servo_friend_audio_server_plugin" && set "MOD_Dep_Name=Servo Friend Audio Server Plugin"
	set "MOD_Req=servo_friend" && set "MOD_Req_Name=Servo Friend"
	if "!LANGUAGE!"=="ru" (
					  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!».▓▓▓▒░░▓▓▒░░░░"
						set "DESC_Dep2=Установите его или удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=Servo Friend Audio Server Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
					  set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=Servo Friend Audio Server Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/504"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "servo_friend_example_addon" if NOT exist "servo_friend" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Servo Friend Example Addon requires Servo Friend"
	set "MOD_Dep=servo_friend_example_addon" && set "MOD_Dep_Name=Servo Friend Example Addon"
	set "MOD_Req=servo_friend" && set "MOD_Req_Name=Servo Friend"
	if "!LANGUAGE!"=="ru" (
				set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!».▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "DESC_Dep2=Установите его или удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=Servo Friend Example Addon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
				set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=Servo Friend Example Addon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/504"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
		REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓Extended Weapon Customization▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓│├─Extended Weapon Customization Base Additions▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓│├─Extended Weapon Customization OWO▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓│└─Extended Weapon Customization Syn Edits▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓└─For the Drip▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
		REM ████░░▒▓▓▓▓└─For the Drip Extra▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "extended_weapon_customization_base_additions" if NOT exist "extended_weapon_customization" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Extended Weapon Customization Base Additions requires Extended Weapon Customization"
	set "MOD_Dep=extended_weapon_customization_base_additions" && set "MOD_Dep_Name=Extended Weapon Customization Base Additions" && set "MOD_Dep_Name3=EWC Base Additions"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
	if "!LANGUAGE!"=="ru" (
									set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «Extended▓▓▒░░▓▓▒░░░░"
		 set "DESC_Dep2=Weapon Customization». Установите его или удалите мод «!MOD_Dep_Name3!».▓▒░░▓▓▒░░░░"
										set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
												 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
									set "DESC_Dep1='!MOD_Dep_Name!' requires the 'Extended▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC_Dep2=Weapon Customization' mod. Install it or remove '!MOD_Dep_Name3!'.▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
									  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
													 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "extended_weapon_customization_owo" if NOT exist "extended_weapon_customization" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Extended Weapon Customization OWO requires Extended Weapon Customization"
	set "MOD_Dep=extended_weapon_customization_owo" && set "MOD_Dep_Name=Extended Weapon Customization OWO" && set "MOD_Dep_Name3=EWC OWO"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
	if "!LANGUAGE!"=="ru" (
						 set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «Extended Weapon▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Customization». Установите его или удалите мод «!MOD_Dep_Name3!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
										set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
									  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
						 set "DESC_Dep1='!MOD_Dep_Name!' requires the 'Extended Weapon▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						 set "DESC_Dep2=Customization'. Install it or remove '!MOD_Dep_Name!'.▓▓▓▒░░▓▓▒░░░░"
									  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
										  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "extended_weapon_customization_syn_edits" if NOT exist "extended_weapon_customization" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: Extended Weapon Customization Syn Edits requires Extended Weapon Customization"
	set "MOD_Dep=extended_weapon_customization_syn_edits" && set "MOD_Dep_Name=Extended Weapon Customization Syn Edits" && set "MOD_Dep_Name3=EWC Syn Edits"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
	if "!LANGUAGE!"=="ru" (
							   set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «Extended Weapon▒░░▓▓▒░░░░"
	set "DESC_Dep2=Customization». Установите его или удалите мод «!MOD_Dep_Name3!».▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
										set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
											set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
							   set "DESC_Dep1='!MOD_Dep_Name!' requires the 'Extended Weapon▓▓▓▓▓▒░░▓▓▒░░░░"
	set "DESC_Dep2=Customization' mod. Install it or remove '!MOD_Dep_Name3!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
									  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
												set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "for_the_drip" if NOT exist "extended_weapon_customization" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: For the Drip requires Extended Weapon Customization"
	set "MOD_Dep=for_the_drip" && set "MOD_Dep_Name=For the Drip"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
	if "!LANGUAGE!"=="ru" (
				  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▒░░▓▓▒░░░░"
	set "DESC_Dep2=его или удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
										set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
				   set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod. Install▓▓▓▓▒░░▓▓▒░░░░"
				   set "DESC_Dep2='!MOD_Req_Name!' or remove '!MOD_Dep_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
									  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)
if exist "for_the_drip_extra" if NOT exist "for_the_drip" (
	set "DEPENDENCY_ERROR=1"
												call :LOG "Dependency error: For the Drip Extra requires For the Drip"
	set "MOD_Dep=for_the_drip_extra" && set "MOD_Dep_Name=For the Drip Extra"
	set "MOD_Req=for_the_drip" && set "MOD_Req_Name=For the Drip"
	if "!LANGUAGE!"=="ru" (
		set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите его или▓▓▓▒░░▓▓▒░░░░"
		  set "DESC_Dep2=удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
					   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	) else (
	  set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod. Install '!MOD_Req_Name!'▒░░▓▓▒░░░░"
		  set "DESC_Dep2=or remove '!MOD_Dep_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
						   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	)
	set "START_REQMOD_PAGE=start https://github.com/Adspartan/For_the_Drip/releases"
	call :SHOW_SINGLE_DEPENDENCY_ERROR
)

goto :EOF

	:SHOW_SINGLE_DEPENDENCY_ERROR

	if "!LANGUAGE!"=="ru" (
		set "OPT_OPEN_PAGE_1=[S] - Открой страницу: !MOD_Req_Name2!"
		set "OPT_DEL_DEPEN_2=[P] - Удали мод: !MOD_Dep_Name2!"
	) else (
		set "OPT_OPEN_PAGE_1=[S] - Open mod page: !MOD_Req_Name2!"
		set "OPT_DEL_DEPEN_2=[P] - Purge the mod: !MOD_Dep_Name2!"
	)

	cls
	REM mode con cols=100 lines=34
	color 0C
	echo.
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo █▓▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▓██
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ░░░░░░░░░░▒▓▓▓!MSG_SERVIT_ENGD!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ███▓▒▓▓█░░▒▓▓▓!MSG_CRIT_ERROR_!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo ████████░░▒▓▓▓!MSG_DEPEND_MISS!
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo █████▓▒░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░
	echo ██▓░░░░░░░▒▓▓▓!DESC_Dep1!
	echo ██▓░░░░░░░▒▓▓▓!DESC_Dep2!
	echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ░░░█████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░▓█
	echo ▓░░▒▒▒░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓▓▓██
	echo ▓░░░▒▒▒░░░▒▓▓▓!MSG_SELECT_ACTN!
	echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██████▓
	echo █████░░░░░▒▓▓▓!OPT_CONTINUE_NO!
	echo █████░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███░░░░
	echo ████████░░▒▓▓▓!OPT_OPEN_PAGE_1!
	echo ████████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░
	echo ███▓▓▓██░░▒▓▓▓!OPT_DEL_DEPEN_2!
	echo ███▓▓▓██░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒▓▒░░
	echo ▓█▒░░░░░░░▒▓▓▓!OPT_MAN_FL_EXIT!
	echo ░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
	echo ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
	echo ▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓
	echo ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
	echo.
	Choice /c CSPQ
		If Errorlevel 4 (
				start .
				exit
			)
		If Errorlevel 3 (
			if exist "!MOD_Dep!\" (
													call :LOG "Deleting mod: !MOD_Dep!"
				rmdir /s /q "!MOD_Dep!"
			)
			goto :DEPENDENCY_ERROR_RESOLVED
		)
		If Errorlevel 2 !START_REQMOD_PAGE! && exit
													call :LOG "Open !MOD_Req_Name2! mod page"
		If Errorlevel 1 (
			set "DEPENDENCY_ERROR=0"
													call :LOG "DEPENDENCY==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼"
			goto :STEP_6_CREATE_MOD_LIST
		)

goto :EOF

:DEPENDENCY_ERROR_RESOLVED
set "DEPENDENCY_ERROR=0"
goto :STEP_5_CHECK_DEPENDENCIES

:EOF
exit