REM Сделано xsSplater под лицензией GPL 3.0
REM WH40k Darktide - Servo-Modquisitor. Бывший: Mod Load Order File Maker
REM Включение логирования в файл mod_sorter.log:
REM "..:\SteamLibrary\steamapps\common\Warhammer 40,000 DARKTIDE\mods\Servo-Modquisitor_5_ru.bat" --log

@echo off
1>nul chcp 65001
setlocal enableextensions enabledelayedexpansion

title "Вархаммер 40к Дарктайд - Серво-Модквизитор"
mode con cols=100 lines=34

REM Начальные настройки
set "LANGUAGE=ru"
set "SORT_FILE=russian_sort_order.txt"
set "LOG_ENABLED=1"
set "ERROR_COUNT=0"
set "INCOMPATIBLE_FOUND=0"
set "OBSOLETE_FOUND=0"
set "MALFORMED_FOUND=0"
set "EMPTY_FOUND=0"
set "DEPENDENCY_ERROR=0"

REM Обработка параметра --log
REM :PARSE_PARAMETERS
REM if "%~1"=="" goto :PARSE_END
REM if /i "%~1"=="--log" set "LOG_ENABLED=1"
REM shift
REM goto :PARSE_PARAMETERS
REM :PARSE_END

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

	set "OPT_CREATE_NEW_=[C] - Создай новый файл mod_load_order.txt и продолжи сортировку....▓▓▓▓▓▓▓▓▒░░██▓░░░░"
	set "OPT_CONTINUE_NO=[C] - Пропусти и продолжи сортировку... [НЕ рекомендуется‼]▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓░░░░"
	set "OPT_DEL_DEPRCTD=[D] - Удали папки устаревших модов и продолжи сортировку...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_WRNG_UNPCKD=[D] - Удали неправильно распакованные папки и продолжи сортировку...▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_DELET_EMPTY=[D] - Удали пустые папки и продолжи сортировку...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
	set "OPT_STEAM_GUIDE=[S] - Обратитесь к писаниям Омниссии [Руководство Steam]...▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	set "OPT_MANUAL_EXIT=[Q] - Я проведу ручную диагностику...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	set "OPT_MAN_FL_EXIT=[Q] - Я проведу ручную диагностику... Открой папку «mods»‼▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
	set "START_STEAM_GUIDE=start https://steamcommunity.com/sharedfiles/filedetails/?id=2950374474"


		 call :LOGSTART ╔══════════════════════════════Серво-Модквизитор════════════════════════════════╗
		call :LOGHEADER ║	В случае проблем, пришлите этот файл на диагностику.						║
		call :LOGHEADER ║	Нексус:		 https://www.nexusmods.com/warhammer40kdarktide/mods/139		║
		call :LOGHEADER ║	Дискорд мой: https://discord.gg/BGZagw3xnz									║
		call :LOGHEADER ║	ДТ Моддерс:  https://discord.gg/rKYWtaDx4D									║
		call :LOGHEADER ╠════════════════════════╦══════════════════════════════════════════════════════╣


REM											ОМНИССИЯ НАГРАЖДАЕТ ВАС ДОСТИЖЕНИЕМ "ЛЮБОПЫТНЫЙ ПРОГРАММИСТ"!
cls
color 0A
REM Greenish 100 х 30
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

REM Он сказал "Поехали!" и махнул рукой...
:STEP_1_CHECK_INSTALLATION
									   call :LOG ║	1. Запускаю диагностику: проверка BASE и DMF....	║
if NOT exist base (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ ОШИБКА: папка BASE не найдена‼					║
									   call :LOG ╠══════════════════════════════════════════════════════╣
	set /a ERROR_COUNT+=1
	call :SHOW_INSTALLATION_ERROR "base" "Darktide Mod Loader"
)
if NOT exist dmf (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ ОШИБКА: папка DMF не найдена‼					║
									   call :LOG ╠══════════════════════════════════════════════════════╣
	set /a ERROR_COUNT+=1
	call :SHOW_INSTALLATION_ERROR "dmf" "Darktide Mod Framework"
)

if !ERROR_COUNT! GTR 0 (
	pause >nul
	exit
)
										call :LOG ║								Диагностика: ПРОЙДЕНА‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_2_CHECK_MOD_LOAD_ORDER
										call :LOG ║	2. Ищу священное писание: mod_load_order.txt		║
if NOT exist "mod_load_order.txt" call :SHOW_MOD_LOAD_ORDER_MISSING

										call :LOG ║							mod_load_order.txt найден‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_3_CHECK_OBSOLETE_MODS
										call :LOG ║	3. Сканирую: Устаревшие моды...						║
set "OBSOLETE_LIST="
call :CHECK_OBSOLETE_MODS

if !OBSOLETE_FOUND! == 1 (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ Найдены устаревшие моды: !OBSOLETE_LIST!
									   call :LOG ╠══════════════════════════════════════════════════════╣
	call :SHOW_OBSOLETE_MODS_WARNING
)
										call :LOG ║			Очистка не требуется. Нет устаревших модов‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
										call :LOG ║	3-a. Ищу неправильно распакованные моды....			║
set "MALFORMED_LIST="
call :CHECK_MALFORMED_MODS

if !MALFORMED_FOUND! == 1 (
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM call :LOG ║	‼‼ Неправильно распакованные моды: !MALFORMED_LIST!
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM Это сообщение под соответствующим окном ниже!
	call :SHOW_MALFORMED_MODS_WARNING
)
										call :LOG ║			Неправильно распакованных модов не найдено‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_3B_CHECK_EMPTY_FOLDERS
										call :LOG ║	3-b. Ищу пустые папки...							║
set "EMPTY_LIST="
call :CHECK_EMPTY_FOLDERS

if !EMPTY_FOUND! == 1 (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ Найдены пустые папки: !EMPTY_LIST!
									   call :LOG ╠══════════════════════════════════════════════════════╣
	call :SHOW_EMPTY_FOLDERS_WARNING
)
										call :LOG ║							Пустых папок не обнаружено‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_4_CHECK_INCOMPATIBLE_MODS
										call :LOG ║	4. Обнаружение ереси: Несовместимость модов...		║
call :CHECK_INCOMPATIBLE_MODS

if !INCOMPATIBLE_FOUND! == 1 (
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM call :LOG ║	‼‼ Обнаружены несовместимые моды‼					║
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM Это сообщение под соответствующим окном ниже!
	call :SHOW_INCOMPATIBLE_MODS_ERROR
	goto :STEP_4_CHECK_INCOMPATIBLE_MODS
) else (
										call :LOG ║					Несовместимых модов не обнаружено‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣
	goto :STEP_5_CHECK_DEPENDENCIES
)

:STEP_5_CHECK_DEPENDENCIES
										call :LOG ║	5. Проверяю зависимости модов...					║
call :CHECK_DEPENDENCIES

if !DEPENDENCY_ERROR! == 1 (
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM call :LOG ║	‼‼ Найдены проблемы зависимостей модов‼				║
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM Это сообщение под соответствующим окном ниже!
	call :SHOW_DEPENDENCY_ERROR
)
										call :LOG ║			Проблем с зависимостями модов не найдено‼	║

:STEP_6_COMPLETE_MOD_LIST
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	6. Создаю новый список mod_load_order.txt...		║
									   call :LOG ╠══════════════════════════════════════════════════════╣

									   call :LOG ║	6.1. Записываю шапку								║
(echo -- ▒Servo-Modquisitor▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓1. Если вам нужно добавить мод вручную, введите название папки▓▓▓▓▒
 echo -- ▒▓▓▓▓вашего мода ниже. Каждый новый мод обязательно с новой строки.▓▒
 echo -- ▒▓2. Расположение в списке определяет порядок загрузки модов.▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓Чем ниже мод, тем больший приоритет в загрузке у него будет.▓▓▓▒
 echo -- ▒▓3. Не переименовывайте папку мода, т.к. внутри названия папок и▓▓▓▒
 echo -- ▒▓▓▓▓записи внутри файлов зависят от этого названия.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓4. НЕ НУЖНО вносить в список папки «BASE» или «DMF» или вы▓▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓получите ошибку в игре‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓5. Если какой-то мод не попал в список, обязательно сообщите▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓мне об этом в моём Дискорде или на Nexusmods:▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓https://discord.gg/BGZagw3xnz ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓https://www.nexusmods.com/warhammer40kdarktide/mods/139 ▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒xsSplater▒
 echo.)>mod_load_order.txt


									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	6.2. Вношу моды с обязательным порядком сортировки	║
									   call :LOG ╠══════════════════════════════════════════════════════╣
call :ADD_MANDATORY_MODS

call :ADD_REMAINING_MODS_CUSTOM_SORTED

									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	mod_load_order.txt создан‼							║
									   call :LOG ╠══════════════════════════════════════════════════════╣

cls
color 0A
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
												call :LOGENDSUCCESS

start mod_load_order.txt
exit


:ADD_MANDATORY_MODS
REM ╔═══════════════════════════════════════════════════╗
REM ║ ПРАВИЛА СОРТИРОВКИ								║
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
REM ╟+ GlobalStore										║
REM ╚═══════════════════════════════════════════════════╝

if exist "CharacterGrid\" (
	echo CharacterGrid>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Character Grid
)
if exist "LogMeIn\" (
	echo LogMeIn>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Log Me In
)
if exist "Reconnect\" (
	echo Reconnect>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Reconnect
)
if exist "psych_ward\" (
	echo psych_ward>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Psych Ward
)
if exist "DarktideLocalServer\" (
	echo DarktideLocalServer>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Darktide Local Server
)
	if exist "Audio\" (
		echo Audio>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Audio
	)
if exist "animation_events\" (
	echo animation_events>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Animation Events
)
	if exist "scoreboard\" (
		echo scoreboard>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Scoreboard
	)
		if exist "ScoreboardAmmos\" (
			echo ScoreboardAmmos>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Scoreboard Ammunitions picked
		)
		if exist "ScoreboardDamage\" (
			echo ScoreboardDamage>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Scoreboard Damage
		)
		if exist "scoreboard_enhanced_defense_plugin\" (
			echo scoreboard_enhanced_defense_plugin>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Scoreboard Enhanced Defense Plugin
		)
		if exist "ScoreboardExplosive\" (
			echo ScoreboardExplosive>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Scoreboard Explosive
		)
		if exist "ScoreboardTagCounter\" (
			echo ScoreboardTagCounter>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Scoreboard Tag Counter
		)
		if exist "ovenproof_scoreboard_plugin\" (
			echo ovenproof_scoreboard_plugin>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Ovenproof`s Scoreboard Plugin
		)
		if exist "scoreboard_vermintide_plugin\" (
			echo scoreboard_vermintide_plugin>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Vermintide Scoreboard Plugin
		)
if exist "ChatBlock\" (
	echo ChatBlock>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Chat Block
)
if exist "master_item_community_patch\" (
	echo master_item_community_patch>> mod_load_order.txt
										call :LOG ║	Добавлен мод: MasterItem Community Patch
)
if exist "MultiBind\" (
	echo MultiBind>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Multi Bind
)
if exist "ToggleAltFire\" (
	echo ToggleAltFire>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Toggle Alt Fire
)
if exist "guarantee_ability_activation\" (
	echo guarantee_ability_activation>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Guarantee Ability Activation
)
if exist "guarantee_weapon_swap\" (
	echo guarantee_weapon_swap>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Guarantee Weapon Swap
)
if exist "guarantee_special_action\" (
	echo guarantee_special_action>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Guarantee Special Action
)
if exist "hybrid_sprint\" (
	echo hybrid_sprint>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Hybrid Sprint
)
if exist "Power_DI\" (
	echo Power_DI>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Power DI
)
if exist "true_level\" (
	echo true_level>> mod_load_order.txt
										call :LOG ║	Добавлен мод: True Level
)
	if exist "Do I Know You\" (
		echo Do I Know You>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Do I Know You
)
if exist "servo_friend\" (
	echo servo_friend>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Servo Friend
)
	if exist "servo_friend_audio_server_plugin\" (
		echo servo_friend_audio_server_plugin>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Servo Friend Audio Server Plugin
)
	if exist "servo_friend_example_addon\" (
		echo servo_friend_example_addon>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Servo Friend Example Addon
)
if exist "extended_weapon_customization\" (
	echo extended_weapon_customization>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Extended Weapon Customization
)
	if exist "extended_weapon_customization_base_additions\" (
		echo extended_weapon_customization_base_additions>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Extended Weapon Customization Base Additions
)
	if exist "extended_weapon_customization_owo\" (
		echo extended_weapon_customization_owo>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Extended Weapon Customization OWO
)
	if exist "extended_weapon_customization_syn_edits\" (
		echo extended_weapon_customization_syn_edits>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Extended Weapon Customization Syn Edits
)
	if exist "for_the_drip\" (
		echo for_the_drip>> mod_load_order.txt
										call :LOG ║	Добавлен мод: For the Drip
)
	if exist "for_the_drip_extra\" (
		echo for_the_drip_extra>> mod_load_order.txt
										call :LOG ║	Добавлен мод: For the Drip Extra
)
if exist "who_are_you\" (
	echo who_are_you>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Who are you
)
if exist "GlobalStore\" (
	echo GlobalStore>> mod_load_order.txt
										call :LOG ║	Добавлен мод: Global Store
)

goto :EOF


:ADD_REMAINING_MODS_CUSTOM_SORTED
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	6.3. Применяю паттерн: !SORT_FILE!		║

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
echo GlobalStore>> exclude.tmp

REM Проверяем наличие и непустоту файла с порядком сортировки
if exist "!SORT_FILE!" (
	for %%F in ("!SORT_FILE!") do if %%~zF GTR 0 (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	Сортирую остальные моды...							║
									   call :LOG ╠══════════════════════════════════════════════════════╣

		for /f "usebackq delims=" %%i in ("!SORT_FILE!") do (
			set "mod_name=%%i"

			for /f "tokens=* delims= " %%a in ("!mod_name!") do set "mod_name=%%a"
			for /f "delims=" %%a in ("!mod_name!") do set "mod_name=%%a"

			if not "!mod_name!"=="" (
				if exist "!mod_name!\" (
					findstr /i /c:"!mod_name!" exclude.tmp >nul 2>&1
					if errorlevel 1 (
						findstr /i /x /c:"%%i" mod_load_order.txt >nul 2>&1
						if errorlevel 1 (
							echo !mod_name!>> mod_load_order.txt
										call :LOG ║	Добавлен мод: !mod_name!
						) else (
										call :LOG ║	Мод !mod_name! уже есть в mod_load_order.txt
						)
					)
				)
			)
		)

									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	Моды не сортированные в !SORT_FILE!		║
									   call :LOG ╠══════════════════════════════════════════════════════╣

		for /f "tokens=*" %%i in ('dir /b /ad ^| findstr /iv /g:exclude.tmp') do (
			set "check_mod=%%i"
			set "found_in_list=0"

			findstr /i /x /c:"!check_mod!" "!SORT_FILE!" >nul 2>&1
			if !errorlevel! equ 0 set "found_in_list=1"

			if "!found_in_list!"=="0" (
				findstr /i /x /c:"%%i" mod_load_order.txt >nul 2>&1
				if errorlevel 1 (
					echo %%i>> mod_load_order.txt
										call :LOG ║	Добавлен мод: %%i
				)
			)
		)
	) else (
										call :LOG ║	Файл с порядком сортировки пуст‼					║
										call :LOG ║	Сортирую по английскому алфавиту...					║
		goto :CUSTOM_SORT_FALLBACK
	)
) else (
	:CUSTOM_SORT_FALLBACK
										call :LOG ║	Файл с порядком сортировки пуст‼					║
										call :LOG ║	Сортирую по английскому алфавиту...					║
	 for /f "tokens=*" %%i in ('dir /b /ad ^| findstr /iv /g:exclude.tmp ^| sort') do (
		echo %%i>> mod_load_order.txt
	)
)

if exist exclude.tmp del exclude.tmp

goto :EOF

:IS_MOD_ALREADY_LISTED
set "ALREADY_LISTED=0"
for /f "usebackq delims=" %%j in ("mod_load_order.txt") do (
	if "%%j"=="%~1" set "ALREADY_LISTED=1"
)
goto :EOF



REM ████████████████████████████████████████████████████████████████████████████████████████████████████
REM █████DIALOGS AND CHECKS█████████████████████████████████████████████████████████████████████████████
REM █████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM █████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████

:SHOW_INSTALLATION_ERROR
set "MISSING_FOLDER=%~1"
set "MOD_NAME=%~2"
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓DARKTIDE MOD LOADER - в зависимости от языка выбираем специфический диалог▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if "!MISSING_FOLDER!"=="base" (
	set "NEXUS_PAGE_DMLF=start https://www.nexusmods.com/warhammer40kdarktide/mods/19"
														set "MSG_SPACES=▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
set "OPT_DMLF__NEXUS=[N] - Доступ к реликварию «DARKTIDE MOD LOADER» [Nexus]...▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
)
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓DARKTIDE MOD FRAMEWORK - в зависимости от языка выбираем специфический диалог▓▓▒░░███████
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if "!MISSING_FOLDER!"=="dmf" (
	set "NEXUS_PAGE_DMLF=start https://www.nexusmods.com/warhammer40kdarktide/mods/8"
														  set "MSG_SPACES=▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
set "OPT_DMLF__NEXUS=[N] - Доступ к реликварию «DARKTIDE MOD FRAMEWORK» [Nexus]...▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░███████"
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████████████████████████████████████████████████████████████████████████████████████████████████████
)

	set "MSG_FLDR_BASE_NOT_FOUND=// Папка «!MISSING_FOLDER!» мода «!MOD_NAME!» не найдена‼"

cls
color 0C
REM Reddish 100 х 30
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
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			exit
		)
		If Errorlevel 2 (
			!NEXUS_PAGE_DMLF!
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			exit
		)
		If Errorlevel 1 (
			!START_STEAM_GUIDE!
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			exit
		)
goto :EOF


:SHOW_MOD_LOAD_ORDER_MISSING
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	mod_load_order.txt не найден‼						║
									   call :LOG ╠══════════════════════════════════════════════════════╣
cls
color 0C
REM Reddish 100 х 30
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
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			exit
		)
		If Errorlevel 2 (
			!START_STEAM_GUIDE!
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			exit
		)
		If Errorlevel 1 (
			echo.>mod_load_order.txt
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	mod_load_order.txt создан‼							║
									   call :LOG ╠══════════════════════════════════════════════════════╣
			goto :STEP_3_CHECK_OBSOLETE_MODS
		)
goto :EOF


:CHECK_OBSOLETE_MODS
set "OBSOLETE_FOUND=0"
set "OBSOLETE_LIST="
set "FOUND_OBSOLETE_FOLDERS="

set "OBSOLETE_MODS=ads_crosshair AimSensitivity ammo_med_markers barter_at_once barter_with_hadron book_finder CharWallets chest_markers CircumstanceFix CombatEvolved consistent_flamer_backpacks contracts_overlay CThruShields DarkCache DirectToHadron emote_wheel_fix EnemyAudioReplacer ENLocalizationFIX ENLocalizationFIXAIO ENLocalizationFIXBlessings ENLocalizationFIXCurios ENLocalizationFIXTalents ENLocalizationFIXTraits fancy_bots graphics_options "Height Changer" heretical_idol_marker holier_revenant IgnorePsykerGrenades material_markers ModificationIconColor MuteInBackground MutePerilSounds NoSkull OpenSteamProfile PenanceDetails PlasmaGunLagFix PreferAuric PsykaniumDefaultDifficulty PsykerCriticalPerilQuiet RejectInvitesWhileInMission reroll_until_rarity RestoreRagdollInteraction RetainSelection reveal_blessings RULocalizationFIX RULocalizationFIXAchievements RULocalizationFIXBlessings RULocalizationFIXBlessnTalentsNames RULocalizationFIXCurios RULocalizationFIXEnemies RULocalizationFIXMenus RULocalizationFIXStores RULocalizationFIXTalents RULocalizationFIXTraits RULocalizationFIXTitles RULocalizationFIXWeaponnames x_Enhanced_RU_Localization settings_extension sorted_mission_grid SpaceToContinue SpectatorHUD TaintedDevices_markers TransparentShield TruePeril ui_extension weapon_customization weapon_customization_chains weapon_customization_mt_stuff weapon_customization_no_scope weapon_customization_owo weapon_customization_plugin weapon_customization_plugin_xsSythes weapon_customization_syn_edits which_book WhichMissions"

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
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████████████████████████████████████████████████████████████████████████████████████████
)

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
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			exit
		)
		If Errorlevel 2 (
			call :DELETE_OBSOLETE_MODS
			goto :STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
		)
		If Errorlevel 1 (
			set "OBSOLETE_FOUND=0"
									call :LOG ║	УСТАРЕВШИЙ МОД==ПРОПУСК??? ОЙ, ЗРЯААААА‼‼‼	════════════╣
			goto :STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
		)
goto :EOF

:DELETE_OBSOLETE_MODS
for %%f in (%OBSOLETE_MODS%) do (
	if exist "%%~f\" (
									call :LOG ║	Удалён устаревший мод: %%~f
		rmdir /s /q "%%~f"
	)
)
									call :LOG ║	Очистка от устаревших модов завершена‼	════════════════╣
goto :EOF


:CHECK_MALFORMED_MODS
set "MALFORMED_FOUND=0"
set "MALFORMED_LIST="
REM Проверка на наличие папок с числовыми суффиксами в стиле Nexus
for /d %%f in (*-*-*-*-*) do (
	if exist "%%f\" (
		set "MALFORMED_FOUND=1"
		set "MALFORMED_LIST=!MALFORMED_LIST!%%~f "
	)
)

:SHOW_MALFORMED_MODS_WARNING
if "!MALFORMED_FOUND!"=="0" goto :EOF
cls
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
echo ▓█▒░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓№!▓▓▓#▓▓▓^%▓▓▓@░░█^&!7█▓
	 for %%f in (!MALFORMED_LIST!) do (
echo ██▓░░░░░░░▒▓▓▓%%~f )
echo █░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓$'▓▓▒░░'██;██
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
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ Неправильная распаковка: !MALFORMED_LIST!
									   call :LOG ╠══════════════════════════════════════════════════════╣
	Choice /c CQ
		If Errorlevel 2 (
			start .
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			REM pause
			exit
		)
		If Errorlevel 1 (
			set "MALFORMED_FOUND=0"
										call :LOG ║	ПЛОХО РАСПАКОВАННЫЙ МОД==ПРОПУСК??? ОЙ, ЗРЯААААА‼‼‼	╣
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
		)
	)
)
goto :EOF

:SHOW_EMPTY_FOLDERS_WARNING
if "!EMPTY_FOUND!"=="0" goto :EOF
cls
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
									call :LOGMANUALDIAGNOSTIC
									call :LOGEND
			REM pause
			exit
		)
		If Errorlevel 1 (
			set "EMPTY_FOUND=0"
									call :LOG ║	ПУСТАЯ ПАПКА==ПРОПУСК??? ОЙ, ЗРЯААААА‼‼‼	════════════╣
			goto :STEP_4_CHECK_INCOMPATIBLE_MODS
		)
goto :EOF


:CHECK_INCOMPATIBLE_MODS
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
	   set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	   set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Remove Tag Skulls▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Numeric UI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
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
set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Unga Bunga▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "Skitarius\" if exist "KeepSwinging\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=KeepSwinging" && set "MOD1_Name=Keep Swinging"
	set "MOD2=Skitarius" && set "MOD2_Name=Skitarius"
  set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
  set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Keep Swinging▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "Skitarius\" if exist "FullAuto\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=FullAuto" && set "MOD1_Name=Full Auto"
	set "MOD2=Skitarius" && set "MOD2_Name=Skitarius"
set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Full Auto▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Custom HUD VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─None HUD▓▓▓▓!уже нет на Нексусе!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "custom_hud\" if exist "ToggleHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=ToggleHUD" && set "MOD1_Name=Toggle HUD"
	set "MOD2=custom_hud" && set "MOD2_Name=Custom HUD"
set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC2=В «!MOD2_Name!», помимо прочего, можно отключать интерфейс клавишей F2.▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "custom_hud\" if exist "NoneHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=NoneHUD" && set "MOD1_Name=None HUD"
	set "MOD2=custom_hud" && set "MOD2_Name=Custom HUD"
set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC2=В «!MOD2_Name!», помимо прочего, можно отключать интерфейс клавишей F2.▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Toggle HUD VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─None HUD▓▓▓▓!уже нет на Нексусе!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ToggleHUD\" if exist "NoneHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=NoneHUD" && set "MOD1_Name=None HUD"
	set "MOD2=ToggleHUD" && set "MOD2_Name=Toggle HUD"
set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2=«!MOD2_Name!»имеет ту же функциональность, что и «!MOD1_Name!».▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Solo Play VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Prologue▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "SoloPlay\" if exist "prologue\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=prologue" && set "MOD1_Name=Prologue"
	set "MOD2=SoloPlay" && set "MOD2_Name=Solo Play"
set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Prologue▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Solo Play▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Display Ping VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Ping Monitor▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "DisplayPing\" if exist "PingMonitor\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=PingMonitor" && set "MOD1_Name=Ping Monitor"
	set "MOD2=DisplayPing" && set "MOD2_Name=Display Ping"
	set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Ping Monitor▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Display Ping▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Show Weapons In Lobby VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Mission Lobby - Show Ranged Weapons▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ShowEquippedInLobby\" if exist "Mission Lobby - Show Ranged Weapons\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Mission Lobby - Show Ranged Weapons" && set "MOD1_Name=Mission Lobby - Show Ranged Weapons"
	set "MOD2=ShowEquippedInLobby" && set "MOD2_Name=Show Weapons in Lobby"
									set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы▒░░▓▓▒░░░░"
  set "DESC2=Оба мода имеют схожую функциональность.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Mission Lobby - Show Ranged Weapons▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Show Weapons in Lobby▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
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
			   set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Found Ya▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "markers_aio\" if exist "Ration Pack\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Ration Pack" && set "MOD1_Name=Ration Pack"
	set "MOD2=markers_aio" && set "MOD2_Name=Markers Improved All-In-One" && set "MOD2_Name3=Markers Improved AIO"
				  set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Ration Pack▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "markers_aio\" if exist "StimmsPickupIcon\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=StimmsPickupIcon" && set "MOD1_Name=Stimms Pickup Icon"
	set "MOD2=markers_aio" && set "MOD2_Name=Markers Improved All-In-One" && set "MOD2_Name3=Markers Improved AIO"
						 set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC2=«!MOD2_Name3!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Stimms Pickup Icon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Teammate Tracker VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "teammate_tracker\" if exist "Do I Know You\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Do I Know You" && set "MOD1_Name=Do I Know You"
	set "MOD2=teammate_tracker" && set "MOD2_Name=Teammate Tracker"
		 set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2=«!MOD2_Name!» имеет в себе функционал мода «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Teammate Tracker▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Better Loadouts VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─More Characters and Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "BetterLoadouts\" if exist "more_characters_and_loadouts\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=more_characters_and_loadouts" && set "MOD1_Name=More Characters and Loadouts"
	set "MOD2=BetterLoadouts" && set "MOD2_Name=Better Loadouts"
					   set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "DESC2=«!MOD2_Name!» имеет в себе функционал «!MOD1_Name!».▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=More Characters and Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Better Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Simple Color Selector VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Color Selection▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "simplecolorselector\" if exist "ColorSelection\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=ColorSelection" && set "MOD1_Name=Color Selection"
	set "MOD2=simplecolorselector" && set "MOD2_Name=Simple Color Selector"
				set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				set "DESC2=«!MOD2_Name!» имеет в себе функционал «!MOD1_Name!».▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Color Selection▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Simple Color Selector▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Killfeed Improvements VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Killfeed Details▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "KillfeedImprovements\" if exist "Killfeed Details\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Killfeed Details" && set "MOD1_Name=Killfeed Details"
	set "MOD2=KillfeedImprovements" && set "MOD2_Name=Killfeed Improvements"
				 set "DESC1=«!MOD2_Name!» и «!MOD1_Name!» несовместимы‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC2=«!MOD2_Name!» имеет серьёзный конфликт с «!MOD1_Name!».▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD1_Name2=Killfeed Details▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			  set "MOD2_Name2=Killfeed Improvements▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
goto :EOF


:SHOW_INCOMPATIBLE_MODS_ERROR
if "!INCOMPATIBLE_FOUND!"=="0" goto :EOF

	set "OPT_DEL_CONFL_1=[F] - Удали мод: !MOD1_Name2!"
	set "OPT_DEL_CONFL_2=[S] - Удали мод: !MOD2_Name2!"

cls
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
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ Несовместимые моды: !MOD1_Name! и !MOD2_Name!
									   call :LOG ╠══════════════════════════════════════════════════════╣
	Choice /c CFSQ
		If Errorlevel 4 (
			start .
										call :LOGMANUALDIAGNOSTIC
										call :LOGEND
			exit
		)
		If Errorlevel 3 (
			if exist "!MOD2!\" (
										call :LOG ║	Удалён мод: !MOD2_Name!
				rmdir /s /q "!MOD2!"
			)
			goto :CONFLICTS_RESOLVED
		)
		If Errorlevel 2 (
			if exist "!MOD1!\" (
										call :LOG ║	Удалён мод: !MOD1_Name!
				rmdir /s /q "!MOD1!"
			)
			goto :CONFLICTS_RESOLVED
		)
		If Errorlevel 1 (
			set "INCOMPATIBLE_FOUND=0"
										call :LOG ║	НЕСОВМЕСТИМОСТЬ==ПРОПУСК??? ОЙ, ЗРЯААААА‼‼‼	════════╣
			goto :STEP_5_CHECK_DEPENDENCIES
		)
goto :EOF

:CONFLICTS_RESOLVED
set "INCOMPATIBLE_FOUND=0"
goto :STEP_5_CHECK_DEPENDENCIES


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
if exist "Audio\" if NOT exist "DarktideLocalServer\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=Audio" && set "MOD_Dep_Name=Audio"
	set "MOD_Req=DarktideLocalServer" && set "MOD_Req_Name=Darktide Local Server"
 set "DESC_Dep1=Моду «!MOD_Dep!» необходим для работы мод «!MOD_Req_Name!». Установите▓▓▓▒░░▓▓▒░░░░"
 set "DESC_Dep2=«!MOD_Req_Name!» или удалите мод «!MOD_Dep!» во избежание ошибок.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
						set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
	   set "MOD_Dep_Name2=!MOD_Dep!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/211"
	call :SHOW_DEPENDENCY_ERROR
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Animation events▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM if exist "scoreboard\" if NOT exist "animation_events\" (
	REM set "DEPENDENCY_ERROR=1"
	REM set "MOD_Dep=scoreboard" && set "MOD_Dep_Name=Scoreboard"
	REM set "MOD_Req=animation_events" && set "MOD_Req_Name=Animation events"
 REM set "DESC_Dep1=«!MOD_Dep_Name!» не покажет некоторые подсчёты без «!MOD_Req_Name!».▓▒░░▓▓▒░░░░"
REM set "DESC_Dep2=Ошибок быть не должно, так что решай сам - устанавливать его или нет.▓▓▓▒░░▓▓▒░░░░"
				 REM set "MOD_Req_Name2=Animation events▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   REM set "MOD_Dep_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	REM set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/21"
	REM call :SHOW_DEPENDENCY_ERROR
REM )

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Scoreboard Ammunitions picked▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Scoreboard Damage▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Scoreboard Enhanced Defense Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Scoreboard Explosive▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Scoreboard Tag Counter▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Ovenproof`s Scoreboard Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Vermintide Scoreboard plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ScoreboardAmmos\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ScoreboardAmmos" && set "MOD_Dep_Name=Scoreboard Ammunitions picked" && set "MOD_Dep_Name3=SB Ammunitions picked"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
		 set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▓▒░░▓▓▒░░░░"
			 set "DESC_Dep2=его или удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▒░░▓▓▒░░░░"
			 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
						  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ScoreboardDamage\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ScoreboardDamage" && set "MOD_Dep_Name=Scoreboard Damage"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите его или▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC_Dep2=удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
			  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "scoreboard_enhanced_defense_plugin\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=scoreboard_enhanced_defense_plugin" && set "MOD_Dep_Name=Scoreboard Enhanced Defense Plugin" && set "MOD_Dep_Name3=SB Enhanced Defense Plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
			  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». ▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC_Dep2=Установите его или удалите «!MOD_Dep_Name3!» во избежание ошибок.▒░░▓▓▒░░░░"
			 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
							   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ScoreboardExplosive\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ScoreboardExplosive" && set "MOD_Dep_Name=Scoreboard Explosive"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите его▓▓▒░░▓▓▒░░░░"
	set "DESC_Dep2=или удалите «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
				 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ScoreboardTagCounter\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ScoreboardTagCounter" && set "MOD_Dep_Name=Scoreboard Tag Counter"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите▓▓▓▓▒░░▓▓▒░░░░"
	  set "DESC_Dep2=его или удалите «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=Scoreboard Tag Counter▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ovenproof_scoreboard_plugin\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ovenproof_scoreboard_plugin" && set "MOD_Dep_Name=Ovenproof`s Scoreboard Plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
		 set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▓▒░░▓▓▒░░░░"
			 set "DESC_Dep2=его или удалите «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=Ovenproof`s Scoreboard Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "scoreboard_vermintide_plugin\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=scoreboard_vermintide_plugin" && set "MOD_Dep_Name=Vermintide Scoreboard plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
		set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▓▓▒░░▓▓▒░░░░"
			set "DESC_Dep2=его или удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=Vermintide Scoreboard plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Power DI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓│True Level▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└┴─Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████

if exist "Do I Know You\" if NOT exist "Power_DI\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=Do I Know You" && set "MOD_Dep_Name=Do I Know You"
	set "MOD_Req=Power_DI" && set "MOD_Req_Name=Power DI"
set "DESC_Dep1=Мод «!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите его▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=или удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "MOD_Req_Name2=Power DI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/281"
	call :SHOW_DEPENDENCY_ERROR
)

if exist "Do I Know You\" if NOT exist "true_level\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=Do I Know You" && set "MOD_Dep_Name=Do I Know You"
	set "MOD_Req=true_level" && set "MOD_Req_Name=True Level"
set "DESC_Dep1=Мод «!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!». Установите его▓▒░░▓▓▒░░░░"
	 set "DESC_Dep2=или удалите мод «!MOD_Dep_Name!» во избежание ошибок.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "MOD_Req_Name2=True Level▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"


	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/156"
	call :SHOW_DEPENDENCY_ERROR
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓├─Servo Friend Audio Server Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Servo Friend Example Addon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "servo_friend_audio_server_plugin\" if NOT exist "servo_friend\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=servo_friend_audio_server_plugin" && set "MOD_Dep_Name=Servo Friend Audio Server Plugin"
	set "MOD_Req=servo_friend" && set "MOD_Req_Name=Servo Friend"
			  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!».▓▓▓▒░░▓▓▒░░░░"
				set "DESC_Dep2=Установите его или удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=Servo Friend Audio Server Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/504"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "servo_friend_example_addon\" if NOT exist "servo_friend\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=servo_friend_example_addon" && set "MOD_Dep_Name=Servo Friend Example Addon"
	set "MOD_Req=servo_friend" && set "MOD_Req_Name=Servo Friend"
		set "DESC_Dep1=«!MOD_Dep_Name!» требует установки мода «!MOD_Req_Name!».▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		  set "DESC_Dep2=Установите его или удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=Servo Friend Example Addon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"

	set "START_REQMOD_PAGE=https://www.nexusmods.com/warhammer40kdarktide/mods/504"
	call :SHOW_DEPENDENCY_ERROR
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Extended Weapon Customization▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓│├─Extended Weapon Customization Base Additions▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓│├─Extended Weapon Customization OWO▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓│└─Extended Weapon Customization Syn Edits▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─For the Drip▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓▓▓└─For the Drip Extra▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "extended_weapon_customization_base_additions\" if NOT exist "extended_weapon_customization\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=extended_weapon_customization_base_additions" && set "MOD_Dep_Name=Extended Weapon Customization Base Additions" && set "MOD_Dep_Name3=EWC Base Additions"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
							set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «Extended▓▓▒░░▓▓▒░░░░"
 set "DESC_Dep2=Weapon Customization». Установите его или удалите мод «!MOD_Dep_Name3!».▓▒░░▓▓▒░░░░"
								set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
										 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"

	set "START_REQMOD_PAGE=https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "extended_weapon_customization_owo\" if NOT exist "extended_weapon_customization\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=extended_weapon_customization_owo" && set "MOD_Dep_Name=Extended Weapon Customization OWO" && set "MOD_Dep_Name3=EWC OWO"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
				 set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «Extended Weapon▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Customization». Установите его или удалите «!MOD_Dep_Name3!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
								set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
							  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"

	set "START_REQMOD_PAGE=https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "extended_weapon_customization_syn_edits\" if NOT exist "extended_weapon_customization\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=extended_weapon_customization_syn_edits" && set "MOD_Dep_Name=Extended Weapon Customization Syn Edits" && set "MOD_Dep_Name3=EWC Syn Edits"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
					   set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «Extended Weapon▒░░▓▓▒░░░░"
set "DESC_Dep2=Customization». Установите его или удалите мод «!MOD_Dep_Name3!».▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
								set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
									set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"

	set "START_REQMOD_PAGE=https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "for_the_drip\" if NOT exist "extended_weapon_customization\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=for_the_drip" && set "MOD_Dep_Name=For the Drip"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
		  set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите▓▒░░▓▓▒░░░░"
set "DESC_Dep2=его или удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
								set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
		 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"

	set "START_REQMOD_PAGE=https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "for_the_drip_extra\" if NOT exist "for_the_drip\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=for_the_drip_extra" && set "MOD_Dep_Name=For the Drip Extra"
	set "MOD_Req=for_the_drip" && set "MOD_Req_Name=For the Drip"
set "DESC_Dep1=«!MOD_Dep_Name!» требует установки «!MOD_Req_Name!». Установите его или▓▓▓▒░░▓▓▒░░░░"
  set "DESC_Dep2=удалите мод «!MOD_Dep_Name!».▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ВЫХОД‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"

	set "START_REQMOD_PAGE=https://github.com/Adspartan/For_the_Drip/releases"
	call :SHOW_DEPENDENCY_ERROR
)
goto :EOF

:SHOW_DEPENDENCY_ERROR
	set "OPT_OPEN_PAGE_1=[S] - Открой страницу: !MOD_Req_Name2!"
	set "OPT_DEL_DEPEN_2=[P] - Удали мод: !MOD_Dep_Name2!"

cls
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
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ Найдены проблемы зависимостей модов‼				║
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	ОШИБКА‼ !MOD_Dep_Name! требует !MOD_Req_Name!
	Choice /c CSPQ
		If Errorlevel 4 (
			start .
									   call :LOGMANUALDIAGNOSTIC
									   call :LOG ║	Скачайте требуемый мод:	════════════════════════════╣
									   call :LOG ║	!START_REQMOD_PAGE!
									   call :LOGEND
			exit
		)
		If Errorlevel 3 (
			if exist "!MOD_Dep!\" (
									   call :LOG ║	Удалён мод: !MOD_Dep!
				rmdir /s /q "!MOD_Dep!"
			)
		goto :DEPENDENCY_ERROR_RESOLVED
		)
		If Errorlevel 2 (
			start !START_REQMOD_PAGE!
									   call :LOGMANUALDIAGNOSTIC
									   call :LOG ║	Скачайте требуемый мод:	════════════════════════════╣
									   call :LOG ║	!START_REQMOD_PAGE!
									   call :LOGEND
			exit
		)
		If Errorlevel 1 (
			set "DEPENDENCY_ERROR=0"
										call :LOG ║	ЗАВИСИМОСТЬ==ПРОПУСК??? ОЙ, ЗРЯААААА‼‼‼	════════════╣
			goto :STEP_6_COMPLETE_MOD_LIST
		)
goto :EOF

:DEPENDENCY_ERROR_RESOLVED
set "DEPENDENCY_ERROR=0"
goto :STEP_5_CHECK_DEPENDENCIES
goto :EOF


:LOGSTART
if "!LOG_ENABLED!"=="0" goto :EOF
echo %*> "mod_sorter.log"
goto :EOF

:LOGHEADER
if "!LOG_ENABLED!"=="0" goto :EOF
echo %*>> "mod_sorter.log"
goto :EOF

:LOG
if "!LOG_ENABLED!"=="0" goto :EOF
echo [%DATE% %TIME%] %*>> "mod_sorter.log"
goto :EOF

:LOGMANUALDIAGNOSTIC
if "!LOG_ENABLED!"=="0" goto :EOF
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	Выбрана ручная диагностика...						║
									   call :LOG ╠══════════════════════════════════════════════════════╣
goto :EOF

:LOGEND
if "!LOG_ENABLED!"=="0" goto :EOF
echo ╚═══════════════════════════════════════════════════════════════════════════════╝>> "mod_sorter.log"
goto :EOF

:LOGENDSUCCESS
if "!LOG_ENABLED!"=="0" goto :EOF
echo ╠════════════════════════╩══════════════════════════════════════════════════════╣>> "mod_sorter.log"
echo ╚══════Задание Серво-Модквизитора завершено успешно‼ Слава Богу-Машине‼═════════╝>> "mod_sorter.log"
goto :EOF

:EOF
exit
