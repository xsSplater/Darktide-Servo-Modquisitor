REM Made by xsSplater under GPL 3.0 license
REM WH40k Darktide - Servo-Modquisitor. Ex: Mod Load Order File Maker
REM Enable logging to mod_sorter.log:
REM "..:\SteamLibrary\steamapps\common\Warhammer 40,000 DARKTIDE\mods\Servo-Modquisitor_5_en.bat" --log

@echo off
1>nul chcp 65001
setlocal enableextensions enabledelayedexpansion

title "Warhammer 40к Darktide - Servo-Modquisitor"
mode con cols=100 lines=34

REM Initialize settings
set "LANGUAGE=en"
set "SORT_FILE=english_sort_order.txt"
set "LOG_ENABLED=1"
set "ERROR_COUNT=0"
set "INCOMPATIBLE_FOUND=0"
set "OBSOLETE_FOUND=0"
set "MALFORMED_FOUND=0"
set "EMPTY_FOUND=0"
set "DEPENDENCY_ERROR=0"

REM Parse command line parameters
REM :PARSE_PARAMETERS
REM if "%~1"=="" goto :PARSE_END
REM if /i "%~1"=="--log" set "LOG_ENABLED=1"
REM shift
REM goto :PARSE_PARAMETERS
REM :PARSE_END

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
set "MSG_MLO_NOT_FND=Oops‼ File 'mod_load_order.txt' not found, but that`s okay...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓█▓░░"
set "MSG_NEW_MLO_TXT=I can make a new one...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
set "MSG_SRV_MQ_HERE=// Is the file "Servo-Modquisitor.bat" in the "mods" folder?▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
set "MSG_SELECT_ACTN=++ Select an action, mortal flesh-unit ++▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"
set "MSG_CLEAR_FLDR1=* WARNING: Auto-Purge risks critical data loss. Protocol forbidden. *▓▓▓▓▓▓▓▒░░███████"
set "MSG_CLEAR_FLDR2=* Direct intervention required. Commence manual deletion. *▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████"

set "OPT_CREATE_NEW_=[C] - Create new 'mod_load_order.txt' and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓░░░░"
set "OPT_CONTINUE_NO=[C] - Skip and continue sorting... [Highly NOT recommended‼]▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░██▓░░░░"
set "OPT_DEL_DEPRCTD=[D] - Purge obsolete mods folders and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
set "OPT_WRNG_UNPCKD=[D] - Purge incorrectly unpacked folders and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
set "OPT_DELET_EMPTY=[D] - Purge empty folders and continue sorting...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░░░░░░░░"
set "OPT_STEAM_GUIDE=[S] - Consult the Omnissiah`s scriptures [Steam Guide]...▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
set "OPT_MANUAL_EXIT=[Q] - I shall perform manual diagnostics...▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
set "OPT_MAN_FL_EXIT=[Q] - I shall perform manual diagnostics... Open the 'mods' folder‼▓▓▓EXIT‼▓▒░░███████"
set "START_STEAM_GUIDE=start https://steamcommunity.com/sharedfiles/filedetails/?id=2953324027"


		 call :LOGSTART ╔══════════════════════════════Servo-Modquisitor════════════════════════════════╗
		call :LOGHEADER ║	In case of problems, send this file for diagnostics.						║
		call :LOGHEADER ║	Nexus:		 https://www.nexusmods.com/warhammer40kdarktide/mods/139		║
		call :LOGHEADER ║	Discord my: https://discord.gg/BGZagw3xnz									║
		call :LOGHEADER ║	DT Modders:  https://discord.gg/rKYWtaDx4D									║
		call :LOGHEADER ╠════════════════════════╦══════════════════════════════════════════════════════╣


REM													OMNISSIAH GRANTS YOU THE ACHIEVEMENT "CURIOUS CODER"!
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


:STEP_1_CHECK_INSTALLATION
									   call :LOG ║	1. Engaging diagnostics: Checking BASE and DMF....	║
if NOT exist base (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ ERROR: BASE folder not found‼					║
									   call :LOG ╠══════════════════════════════════════════════════════╣
	set /a ERROR_COUNT+=1
	call :SHOW_INSTALLATION_ERROR "base" "Darktide Mod Loader"
)
if NOT exist dmf (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ ERROR: DMF folder not found‼					║
									   call :LOG ╠══════════════════════════════════════════════════════╣
	set /a ERROR_COUNT+=1
	call :SHOW_INSTALLATION_ERROR "dmf" "Darktide Mod Framework"
)

if !ERROR_COUNT! GTR 0 (
	pause >nul
	exit
)
										call :LOG ║								Diagnostics: PASSED‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_2_CHECK_MOD_LOAD_ORDER
										call :LOG ║	2. Seeking load order scripture: mod_load_order.txt	║
if NOT exist "mod_load_order.txt" call :SHOW_MOD_LOAD_ORDER_MISSING

										call :LOG ║							mod_load_order.txt finded‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_3_CHECK_OBSOLETE_MODS
										call :LOG ║	3. Purging scan: Obsolete mods...					║
set "OBSOLETE_LIST="
	call :CHECK_OBSOLETE_MODS

if !OBSOLETE_FOUND! == 1 (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ Obsolete mods found: !OBSOLETE_LIST!
									   call :LOG ╠══════════════════════════════════════════════════════╣
	call :SHOW_OBSOLETE_MODS_WARNING
)
										call :LOG ║			Purge unnecessary. NO Obsolete data found‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
										call :LOG ║	3-a. Inspecting for Malformed mod containers...		║
set "MALFORMED_LIST="
	call :CHECK_MALFORMED_MODS

if !MALFORMED_FOUND! == 1 (
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM call :LOG ║	‼‼ Malformed mods found: !MALFORMED_LIST!
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM This message is under the corresponding window below!
	call :SHOW_MALFORMED_MODS_WARNING
)
										call :LOG ║							Malformed mods NOT found‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_3B_CHECK_EMPTY_FOLDERS
										call :LOG ║	3-b. Scanning for void-folders...					║
set "EMPTY_LIST="
	call :CHECK_EMPTY_FOLDERS

if !EMPTY_FOUND! == 1 (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	‼‼ Empty folders found: !EMPTY_LIST!
									   call :LOG ╠══════════════════════════════════════════════════════╣
	call :SHOW_EMPTY_FOLDERS_WARNING
)
										call :LOG ║				Void scan negative. Space is utilized‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣

:STEP_4_CHECK_INCOMPATIBLE_MODS
										call :LOG ║	4. Heresy detection: Incompatible mods...			║
	call :CHECK_INCOMPATIBLE_MODS

if !INCOMPATIBLE_FOUND! == 1 (
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM call :LOG ║	‼‼ Incompatible mods detected‼						║
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM This message is under the corresponding window below!
	call :SHOW_INCOMPATIBLE_MODS_ERROR
	goto :STEP_4_CHECK_INCOMPATIBLE_MODS
) else (
										call :LOG ║							No incompatible mods found‼	║
									   call :LOG ╠══════════════════════════════════════════════════════╣
	goto :STEP_5_CHECK_DEPENDENCIES
)

:STEP_5_CHECK_DEPENDENCIES
										call :LOG ║	5. Verifying mod dependencies...					║
	call :CHECK_DEPENDENCIES

if !DEPENDENCY_ERROR! == 1 (
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM call :LOG ║	‼‼ Dependency Errors found‼							║
								   REM call :LOG ╠══════════════════════════════════════════════════════╣
								   REM This message is under the corresponding window below!
	call :SHOW_DEPENDENCY_ERROR
)
										call :LOG ║						Dependency errors NOT found‼	║

:STEP_6_COMPLETE_MOD_LIST
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	6. Forging new mod_load_order.txt scripture...		║
									   call :LOG ╠══════════════════════════════════════════════════════╣

									   call :LOG ║	6.1. Inscribing header								║
(echo -- ▒Servo-Modquisitor▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓1. If you need to add a mod manually, enter the folder name of▓▓▓▓▒
 echo -- ▒▓▓▓▓your mod below. Each new mod must be on a new line.▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓2. Order in the list determines the order in which mods are▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓loaded. The lower the mod, the higher the loading priority.▓▓▓▓▒
 echo -- ▒▓3. Do not rename the mod folder, because the folder names and▓▓▓▓▓▒
 echo -- ▒▓▓▓▓entries inside the files depend on this name.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓4. DO NOT list the "BASE" or "DMF" folders or you will get an▓▓▓▓▓▒
 echo -- ▒▓▓▓▓error in the game‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓5. If any mod got 'lost' during sorting and wasn`t added to the▓▓▓▒
 echo -- ▒▓▓▓▓list, please let me know on my Discord or on Nexusmods:▓▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓https://discord.gg/BGZagw3xnz ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓https://www.nexusmods.com/warhammer40kdarktide/mods/139 ▓▓▓▓▓▓▓▒
 echo -- ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
 echo -- ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒xsSplater▒
 echo.)>mod_load_order.txt


									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	6.2. Implementing mandatory mods					║
									   call :LOG ╠══════════════════════════════════════════════════════╣
	call :ADD_MANDATORY_MODS

	call :ADD_REMAINING_MODS_CUSTOM_SORTED

									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	mod_load_order.txt is complete‼						║
									   call :LOG ╠══════════════════════════════════════════════════════╣

cls
color 0A
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
										call :LOGENDSUCCESS

start mod_load_order.txt
exit


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
REM ╟+ GlobalStore										║
REM ╚═══════════════════════════════════════════════════╝

if exist "CharacterGrid\" (
	echo CharacterGrid>> mod_load_order.txt
										call :LOG ║	Added mod: Character Grid
)
if exist "LogMeIn\" (
	echo LogMeIn>> mod_load_order.txt
										call :LOG ║	Added mod: Log Me In
)
if exist "Reconnect\" (
	echo Reconnect>> mod_load_order.txt
										call :LOG ║	Added mod: Reconnect
)
if exist "psych_ward\" (
	echo psych_ward>> mod_load_order.txt
										call :LOG ║	Added mod: Psych Ward
)
if exist "DarktideLocalServer\" (
	echo DarktideLocalServer>> mod_load_order.txt
										call :LOG ║	Added mod: Darktide Local Server
)
	if exist "Audio\" (
		echo Audio>> mod_load_order.txt
										call :LOG ║	Added mod: Audio
	)
if exist "animation_events\" (
	echo animation_events>> mod_load_order.txt
										call :LOG ║	Added mod: Animation Events
)
	if exist "scoreboard\" (
		echo scoreboard>> mod_load_order.txt
										call :LOG ║	Added mod: Scoreboard
	)
		if exist "ScoreboardAmmos\" (
			echo ScoreboardAmmos>> mod_load_order.txt
										call :LOG ║	Added mod: Scoreboard Ammunitions picked
		)
		if exist "ScoreboardDamage\" (
			echo ScoreboardDamage>> mod_load_order.txt
										call :LOG ║	Added mod: Scoreboard Damage
		)
		if exist "scoreboard_enhanced_defense_plugin\" (
			echo scoreboard_enhanced_defense_plugin>> mod_load_order.txt
										call :LOG ║	Added mod: Scoreboard Enhanced Defense Plugin
		)
		if exist "ScoreboardExplosive\" (
			echo ScoreboardExplosive>> mod_load_order.txt
										call :LOG ║	Added mod: Scoreboard Explosive
		)
		if exist "ScoreboardTagCounter\" (
			echo ScoreboardTagCounter>> mod_load_order.txt
										call :LOG ║	Added mod: Scoreboard Tag Counter
		)
		if exist "ovenproof_scoreboard_plugin\" (
			echo ovenproof_scoreboard_plugin>> mod_load_order.txt
										call :LOG ║	Added mod: Ovenproof`s Scoreboard Plugin
		)
		if exist "scoreboard_vermintide_plugin\" (
			echo scoreboard_vermintide_plugin>> mod_load_order.txt
										call :LOG ║	Added mod: Vermintide Scoreboard Plugin
		)
if exist "ChatBlock\" (
	echo ChatBlock>> mod_load_order.txt
										call :LOG ║	Added mod: Chat Block
)
if exist "master_item_community_patch\" (
	echo master_item_community_patch>> mod_load_order.txt
										call :LOG ║	Added mod: MasterItem Community Patch
)
if exist "MultiBind\" (
	echo MultiBind>> mod_load_order.txt
										call :LOG ║	Added mod: Multi Bind
)
if exist "ToggleAltFire\" (
	echo ToggleAltFire>> mod_load_order.txt
										call :LOG ║	Added mod: Toggle Alt Fire
)
if exist "guarantee_ability_activation\" (
	echo guarantee_ability_activation>> mod_load_order.txt
										call :LOG ║	Added mod: Guarantee Ability Activation
)
if exist "guarantee_weapon_swap\" (
	echo guarantee_weapon_swap>> mod_load_order.txt
										call :LOG ║	Added mod: Guarantee Weapon Swap
)
if exist "guarantee_special_action\" (
	echo guarantee_special_action>> mod_load_order.txt
										call :LOG ║	Added mod: Guarantee Special Action
)
if exist "hybrid_sprint\" (
	echo hybrid_sprint>> mod_load_order.txt
										call :LOG ║	Added mod: Hybrid Sprint
)
if exist "Power_DI\" (
	echo Power_DI>> mod_load_order.txt
										call :LOG ║	Added mod: Power DI
)
if exist "true_level\" (
	echo true_level>> mod_load_order.txt
										call :LOG ║	Added mod: True Level
)
	if exist "Do I Know You\" (
		echo Do I Know You>> mod_load_order.txt
										call :LOG ║	Added mod: Do I Know You
)
if exist "servo_friend\" (
	echo servo_friend>> mod_load_order.txt
										call :LOG ║	Added mod: Servo Friend
)
	if exist "servo_friend_audio_server_plugin\" (
		echo servo_friend_audio_server_plugin>> mod_load_order.txt
										call :LOG ║	Added mod: Servo Friend Audio Server Plugin
)
	if exist "servo_friend_example_addon\" (
		echo servo_friend_example_addon>> mod_load_order.txt
										call :LOG ║	Added mod: Servo Friend Example Addon
)
if exist "extended_weapon_customization\" (
	echo extended_weapon_customization>> mod_load_order.txt
										call :LOG ║	Added mod: Extended Weapon Customization
)
	if exist "extended_weapon_customization_base_additions\" (
		echo extended_weapon_customization_base_additions>> mod_load_order.txt
										call :LOG ║	Added mod: Extended Weapon Customization Base Additions
)
	if exist "extended_weapon_customization_owo\" (
		echo extended_weapon_customization_owo>> mod_load_order.txt
										call :LOG ║	Added mod: Extended Weapon Customization OWO
)
	if exist "extended_weapon_customization_syn_edits\" (
		echo extended_weapon_customization_syn_edits>> mod_load_order.txt
										call :LOG ║	Added mod: Extended Weapon Customization Syn Edits
)
	if exist "for_the_drip\" (
		echo for_the_drip>> mod_load_order.txt
										call :LOG ║	Added mod: For the Drip
)
	if exist "for_the_drip_extra\" (
		echo for_the_drip_extra>> mod_load_order.txt
										call :LOG ║	Added mod: For the Drip Extra
)
if exist "who_are_you\" (
	echo who_are_you>> mod_load_order.txt
										call :LOG ║	Added mod: Who are you
)
if exist "GlobalStore\" (
	echo GlobalStore>> mod_load_order.txt
										call :LOG ║	Added mod: Global Store
)

goto :EOF


:ADD_REMAINING_MODS_CUSTOM_SORTED
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	6.3. Applying pattern: !SORT_FILE!		║

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

REM Checking the existence and non-emptiness of the sort order file
if exist "!SORT_FILE!" (
	for %%F in ("!SORT_FILE!") do if %%~zF GTR 0 (
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	Mod array processing...								║
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
										call :LOG ║	Added mod: !mod_name!
						) else (
										call :LOG ║	Mod !mod_name! already in mod_load_order.txt
						)
					)
				)
			)
		)

									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	Mods not sorted in the !SORT_FILE! file	║
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
										call :LOG ║	Added mod: %%i
				)
			)
		)
	) else (
										call :LOG ║	Custom sort order file is empty‼					║
										call :LOG ║	Using alphabetical sorting...						║
		goto :CUSTOM_SORT_FALLBACK
	)
) else (
	:CUSTOM_SORT_FALLBACK
										call :LOG ║	Custom sort order file is empty‼					║
										call :LOG ║	Using alphabetical sorting...						║
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
REM █████░░▒▓▓▓DARKTIDE MOD LOADER▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if "!MISSING_FOLDER!"=="base" (
	set "NEXUS_PAGE_DMLF=start https://www.nexusmods.com/warhammer40kdarktide/mods/19"
																	  set "MSG_SPACES=▓▓▓▓▓▓▓▓▒░░███████"
set "OPT_DMLF__NEXUS=[N] - Access the 'DARKTIDE MOD LOADER' reliquary [Nexus]...▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
)
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓DARKTIDE MOD FRAMEWORK▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM █████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if "!MISSING_FOLDER!"=="dmf" (
	set "NEXUS_PAGE_DMLF=start https://www.nexusmods.com/warhammer40kdarktide/mods/8"
																		set "MSG_SPACES=▓▓▓▓▓▓▒░░███████"
set "OPT_DMLF__NEXUS=[N] - Access the «DARKTIDE MOD FRAMEWORK» reliquary [Nexus]...▓▓▓▓▓▓▓▓EXIT‼▓▒░░███████"
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████████████████████████████████████████████████████████████████████████████████████████████████████
)

set "MSG_FLDR_BASE_NOT_FOUND=// The "!MISSING_FOLDER!" folder of the "!MOD_NAME!" mod was not found‼"

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
									   call :LOG ║	mod_load_order.txt NOT found‼						║
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
									   call :LOG ║		mod_load_order.txt created‼						║
									   call :LOG ╠══════════════════════════════════════════════════════╣
			goto :STEP_3_CHECK_OBSOLETE_MODS
		)
goto :EOF


:CHECK_OBSOLETE_MODS
set "OBSOLETE_FOUND=0"
set "OBSOLETE_LIST="
set "FOUND_OBSOLETE_FOLDERS="

set "OBSOLETE_MODS=ads_crosshair AimSensitivity ammo_med_markers barter_at_once barter_with_hadron book_finder CharWallets chest_markers CircumstanceFix CombatEvolved consistent_flamer_backpacks contracts_overlay CThruShields DarkCache DirectToHadron emote_wheel_fix EnemyAudioReplacer ENLocalizationFIX ENLocalizationFIXAIO ENLocalizationFIXBlessings ENLocalizationFIXCurios ENLocalizationFIXTalents ENLocalizationFIXTraits fancy_bots graphics_options "Height Changer" heretical_idol_marker holier_revenant IgnorePsykerGrenades material_markers ModificationIconColor MuteInBackground MutePerilSounds NoSkull OpenSteamProfile PenanceDetails PlasmaGunLagFix PreferAuric PsykaniumDefaultDifficulty PsykerCriticalPerilQuiet RejectInvitesWhileInMission reroll_until_rarity RestoreRagdollInteraction RetainSelection reveal_blessings RULocalizationFIX RULocalizationFIXAchievements RULocalizationFIXBlessings RULocalizationFIXBlessnTalentsNames RULocalizationFIXCurios RULocalizationFIXEnemies RULocalizationFIXMenus RULocalizationFIXStores RULocalizationFIXTalents RULocalizationFIXTraits RULocalizationFIXTitles RULocalizationFIXWeaponnames x_Enhanced_RU_Localization settings_extension sorted_mission_grid SpaceToContinue SpectatorHUD TaintedDevices_markers TransparentShield TruePeril ui_extension weapon_customization weapon_customization_chains weapon_customization_mt_stuff weapon_customization_no_scope weapon_customization_owo weapon_customization_plugin weapon_customization_plugin_xsSythes weapon_customization_syn_edits which_book WhichMissions"

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
REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░███████
REM ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███████
REM ████████████████████████████████████████████████████████████████████████████████████████


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
										call :LOG ║	OBSOLETE==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼	╣
			goto :STEP_3A_CHECK_MALFORMED_MOD_FOLDERS
		)
goto :EOF

:DELETE_OBSOLETE_MODS
for %%f in (%OBSOLETE_MODS%) do (
	if exist "%%~f\" (
										call :LOG ║	Deleting obsolete mod: %%~f
		rmdir /s /q "%%~f"
	)
)
										call :LOG ║	Purge of Obsolete mods complete‼	════════════════╣
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
									   call :LOG ║	‼‼ Malformed mods: !MALFORMED_LIST!
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
										call :LOG ║	MALFORMED==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼	╣
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
										call :LOG ║	EMPTY==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼	════╣
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
	   set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	   set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Remove Tag Skulls▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Numeric UI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
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
set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Unga Bunga▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "Skitarius\" if exist "KeepSwinging\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=KeepSwinging" && set "MOD1_Name=Keep Swinging"
	set "MOD2=Skitarius" && set "MOD2_Name=Skitarius"
  set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
  set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Keep Swinging▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "Skitarius\" if exist "FullAuto\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=FullAuto" && set "MOD1_Name=Full Auto"
	set "MOD2=Skitarius" && set "MOD2_Name=Skitarius"
set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Full Auto▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Skitarius▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
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
set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC2=In '!MOD2_Name!', you can also disable the interface by pressing F2.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "custom_hud\" if exist "NoneHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=NoneHUD" && set "MOD1_Name=None HUD"
	set "MOD2=custom_hud" && set "MOD2_Name=Custom HUD"
set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC2=In '!MOD2_Name!', you can also disable the interface by pressing F2.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Custom HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Toggle HUD VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─None HUD▓▓▓▓!уже нет на Нексусе!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ToggleHUD\" if exist "NoneHUD\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=NoneHUD" && set "MOD1_Name=None HUD"
	set "MOD2=ToggleHUD" && set "MOD2_Name=Toggle HUD"
set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	  set "DESC2='!MOD2_Name!' has the same functionality as '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=None HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Toggle HUD▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Solo Play VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Prologue▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "SoloPlay\" if exist "prologue\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=prologue" && set "MOD1_Name=Prologue"
	set "MOD2=SoloPlay" && set "MOD2_Name=Solo Play"
set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Prologue▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Solo Play▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Display Ping VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Ping Monitor▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "DisplayPing\" if exist "PingMonitor\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=PingMonitor" && set "MOD1_Name=Ping Monitor"
	set "MOD2=DisplayPing" && set "MOD2_Name=Display Ping"
	set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Ping Monitor▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Display Ping▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Show Weapons In Lobby VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Mission Lobby - Show Ranged Weapons▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "ShowEquippedInLobby\" if exist "Mission Lobby - Show Ranged Weapons\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Mission Lobby - Show Ranged Weapons" && set "MOD1_Name=Mission Lobby - Show Ranged Weapons"
	set "MOD2=ShowEquippedInLobby" && set "MOD2_Name=Show Weapons in Lobby"
									set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
  set "DESC2=incompatible‼ Both mods have similar functionality.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Mission Lobby - Show Ranged Weapons▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Show Weapons in Lobby▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
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
			   set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	   set "DESC2='!MOD2_Name3!' already includes all functionality of '!MOD1_Name!'.▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Found Ya▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "markers_aio\" if exist "Ration Pack\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Ration Pack" && set "MOD1_Name=Ration Pack"
	set "MOD2=markers_aio" && set "MOD2_Name=Markers Improved All-In-One" && set "MOD2_Name3=Markers Improved AIO"
				  set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		  set "DESC2='!MOD2_Name3!' already includes all functionality of '!MOD1_Name!'.▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Ration Pack▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
if exist "markers_aio\" if exist "StimmsPickupIcon\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=StimmsPickupIcon" && set "MOD1_Name=Stimms Pickup Icon"
	set "MOD2=markers_aio" && set "MOD2_Name=Markers Improved All-In-One" && set "MOD2_Name3=Markers Improved AIO"
						 set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC2='!MOD2_Name3!' includes all functionality of '!MOD1_Name!'.▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Stimms Pickup Icon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Markers Improved All-In-One▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Teammate Tracker VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "teammate_tracker\" if exist "Do I Know You\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Do I Know You" && set "MOD1_Name=Do I Know You"
	set "MOD2=teammate_tracker" && set "MOD2_Name=Teammate Tracker"
		 set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		 set "DESC2='!MOD2_Name!' already includes all functionality of '!MOD1_Name!'.▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Teammate Tracker▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Better Loadouts VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─More Characters and Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "BetterLoadouts\" if exist "more_characters_and_loadouts\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=more_characters_and_loadouts" && set "MOD1_Name=More Characters and Loadouts"
	set "MOD2=BetterLoadouts" && set "MOD2_Name=Better Loadouts"
					   set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▒░░▓▓▒░░░░"
					   set "DESC2='!MOD2_Name!' includes functionality of '!MOD1_Name!'.▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=More Characters and Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Better Loadouts▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Simple Color Selector VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Color Selection▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "simplecolorselector\" if exist "ColorSelection\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=ColorSelection" && set "MOD1_Name=Color Selection"
	set "MOD2=simplecolorselector" && set "MOD2_Name=Simple Color Selector"
				set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				set "DESC2='!MOD2_Name!' includes functionality of '!MOD1_Name!'.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Color Selection▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Simple Color Selector▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Killfeed Improvements VS▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Killfeed Details▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
if exist "KillfeedImprovements\" if exist "Killfeed Details\" (
	set "INCOMPATIBLE_FOUND=1"
	set "MOD1=Killfeed Details" && set "MOD1_Name=Killfeed Details"
	set "MOD2=KillfeedImprovements" && set "MOD2_Name=Killfeed Improvements"
				 set "DESC1='!MOD2_Name!' and '!MOD1_Name!' are incompatible‼▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC2='!MOD2_Name!' has a serious conflict with '!MOD1_Name!'.▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD1_Name2=Killfeed Details▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				  set "MOD2_Name2=Killfeed Improvements▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
goto :EOF
)
goto :EOF


:SHOW_INCOMPATIBLE_MODS_ERROR
if "!INCOMPATIBLE_FOUND!"=="0" goto :EOF

set "OPT_DEL_CONFL_1=[F] - Purge the mod: !MOD1_Name2!"
set "OPT_DEL_CONFL_2=[S] - Purge the mod: !MOD2_Name2!"

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
									   call :LOG ║	‼‼ Incompatible mods: !MOD1_Name! and !MOD2_Name!
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
										call :LOG ║	Deleting mod: !MOD2_Name!
				rmdir /s /q "!MOD2!"
			)
			goto :CONFLICTS_RESOLVED
		)
		If Errorlevel 2 (
			if exist "!MOD1!\" (
										call :LOG ║	Deleting mod: !MOD1_Name!
				rmdir /s /q "!MOD1!"
			)
			goto :CONFLICTS_RESOLVED
		)
		If Errorlevel 1 (
			set "INCOMPATIBLE_FOUND=0"
										call :LOG ║	INCOMPATIBLE==C??? NO GOD‼ PLEASE NO‼ NOOOOOOO‼‼‼	╣
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
	set "MOD_Dep=Audio"
	set "MOD_Req=DarktideLocalServer" && set "MOD_Req_Name=Darktide Local Server"
 set "DESC_Dep1='!MOD_Dep!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
					  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
		   set "MOD_Dep_Name2=!MOD_Dep!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/211"
	call :SHOW_DEPENDENCY_ERROR
)

REM ████░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓Animation events▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM ████░░▒▓▓└─Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░███████
REM if exist "scoreboard\" if NOT exist "animation_events\" (
	REM set "DEPENDENCY_ERROR=1"
	REM set "MOD_Dep=scoreboard" && set "MOD_Dep_Name=Scoreboard"
	REM set "MOD_Req=animation_events" && set "MOD_Req_Name=Animation events"
REM set "DESC_Dep1='!MOD_Dep_Name!' has reduced functionality without '!MOD_Req_Name!'.▓▓▓▓▓▓▒░░▓▓▒░░░░"
REM set "DESC_Dep2=No errors expected - install at your own discretion.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   REM set "MOD_Req_Name2=Animation events▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   REM set "MOD_Dep_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	REM set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/21"
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
set "DESC_Dep1='!MOD_Dep_Name3!' requires the '!MOD_Req_Name!' mod to function properly.▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name3!' to avoid errors.▓▓▓▓▓▒░░▓▓▒░░░░"
		   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
							  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ScoreboardDamage\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ScoreboardDamage" && set "MOD_Dep_Name=Scoreboard Damage"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
				  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "scoreboard_enhanced_defense_plugin\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=scoreboard_enhanced_defense_plugin" && set "MOD_Dep_Name=Scoreboard Enhanced Defense Plugin" && set "MOD_Dep_Name3=SB Enhanced Defense Plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
			  set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	 set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name3!' to avoid errors.▒░░▓▓▒░░░░"
		   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
								   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ScoreboardExplosive\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ScoreboardExplosive" && set "MOD_Dep_Name=Scoreboard Explosive"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▒░░▓▓▒░░░░"
		   set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
					 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ScoreboardTagCounter\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ScoreboardTagCounter" && set "MOD_Dep_Name=Scoreboard Tag Counter"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
  set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▒░░▓▓▒░░░░"
  set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=Scoreboard Tag Counter▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "ovenproof_scoreboard_plugin\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=ovenproof_scoreboard_plugin" && set "MOD_Dep_Name=Ovenproof`s Scoreboard Plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
		 set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			 set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=Ovenproof`s Scoreboard Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "scoreboard_vermintide_plugin\" if NOT exist "scoreboard\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=scoreboard_vermintide_plugin" && set "MOD_Dep_Name=Vermintide Scoreboard plugin"
	set "MOD_Req=scoreboard" && set "MOD_Req_Name=Scoreboard"
		set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=Scoreboard▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=Vermintide Scoreboard plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/22"
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
set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=Power DI▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/281"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "Do I Know You\" if NOT exist "true_level\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=Do I Know You" && set "MOD_Dep_Name=Do I Know You"
	set "MOD_Req=true_level" && set "MOD_Req_Name=True Level"
set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod to function properly.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Install '!MOD_Req_Name!' or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=True Level▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=Do I Know You▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/156"
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
			  set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=Servo Friend Audio Server Plugin▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/504"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "servo_friend_example_addon\" if NOT exist "servo_friend\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=servo_friend_example_addon" && set "MOD_Dep_Name=Servo Friend Example Addon"
	set "MOD_Req=servo_friend" && set "MOD_Req_Name=Servo Friend"
		set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
		  set "DESC_Dep2=Install it or remove '!MOD_Dep_Name!' to avoid errors.▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			   set "MOD_Req_Name2=Servo Friend▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			   set "MOD_Dep_Name2=Servo Friend Example Addon▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://www.nexusmods.com/warhammer40kdarktide/mods/504"
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
							set "DESC_Dep1='!MOD_Dep_Name!' requires the Extended▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
 set "DESC_Dep2=Weapon Customization mod. Install it or remove '!MOD_Dep_Name3!'.▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
							  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
											 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "extended_weapon_customization_owo\" if NOT exist "extended_weapon_customization\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=extended_weapon_customization_owo" && set "MOD_Dep_Name=Extended Weapon Customization OWO" && set "MOD_Dep_Name3=EWC OWO"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
				 set "DESC_Dep1='!MOD_Dep_Name!' requires the Extended Weapon▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
				 set "DESC_Dep2=Customization. Install it or remove '!MOD_Dep_Name!'.▓▓▓▓▒░░▓▓▒░░░░"
							  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
								  set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "extended_weapon_customization_syn_edits\" if NOT exist "extended_weapon_customization\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=extended_weapon_customization_syn_edits" && set "MOD_Dep_Name=Extended Weapon Customization Syn Edits" && set "MOD_Dep_Name3=EWC Syn Edits"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
					   set "DESC_Dep1='!MOD_Dep_Name!' requires the Extended Weapon▓▓▓▓▓▓▒░░▓▓▒░░░░"
set "DESC_Dep2=Customization mod. Install it or remove '!MOD_Dep_Name3!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
							  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
										set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "for_the_drip\" if NOT exist "extended_weapon_customization\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=for_the_drip" && set "MOD_Dep_Name=For the Drip"
	set "MOD_Req=extended_weapon_customization" && set "MOD_Req_Name=Extended Weapon Customization"
		   set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod. Install▓▓▓▓▒░░▓▓▒░░░░"
		   set "DESC_Dep2='!MOD_Req_Name!' or remove '!MOD_Dep_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
							  set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
			 set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://backup158.github.io/DarktideWeaponCustomizationOwO/"
	call :SHOW_DEPENDENCY_ERROR
)
if exist "for_the_drip_extra\" if NOT exist "for_the_drip\" (
	set "DEPENDENCY_ERROR=1"
	set "MOD_Dep=for_the_drip_extra" && set "MOD_Dep_Name=For the Drip Extra"
	set "MOD_Req=for_the_drip" && set "MOD_Req_Name=For the Drip"
set "DESC_Dep1='!MOD_Dep_Name!' requires the '!MOD_Req_Name!' mod. Install '!MOD_Req_Name!'▒░░▓▓▒░░░░"
  set "DESC_Dep2=or remove '!MOD_Dep_Name!'.▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
			 set "MOD_Req_Name2=!MOD_Req_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓EXIT‼▓▒░░▓▓▒░░░░"
				   set "MOD_Dep_Name2=!MOD_Dep_Name!▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓▒░░░░"
	set "START_REQMOD_PAGE=start https://github.com/Adspartan/For_the_Drip/releases"
	call :SHOW_DEPENDENCY_ERROR
)
goto :EOF

:SHOW_DEPENDENCY_ERROR
	set "OPT_OPEN_PAGE_1=[S] - Open mod page: !MOD_Req_Name2!"
	set "OPT_DEL_DEPEN_2=[P] - Purge the mod: !MOD_Dep_Name2!"

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
									   call :LOG ║	‼‼ Mod dependency issues found‼						║
									   call :LOG ╠══════════════════════════════════════════════════════╣
									   call :LOG ║	ERROR‼ !MOD_Dep_Name! depends on !MOD_Req_Name!
	Choice /c CSPQ
		If Errorlevel 4 (
			start .
									   call :LOGMANUALDIAGNOSTIC
									   call :LOG ║	Download the required mod:	════════════════════════╣
									   call :LOG ║	!START_REQMOD_PAGE!
									   call :LOGEND
			exit
		)
		If Errorlevel 3 (
			if exist "!MOD_Dep!\" (
										call :LOG ║	Removed mod: !MOD_Dep!
				rmdir /s /q "!MOD_Dep!"
			)
		goto :DEPENDENCY_ERROR_RESOLVED
		)
		If Errorlevel 2 (
			start !START_REQMOD_PAGE!
									   call :LOGMANUALDIAGNOSTIC
									   call :LOG ║	Download the required mod:	════════════════════════╣
									   call :LOG ║	!START_REQMOD_PAGE!
									   call :LOGEND
			exit
		)
		If Errorlevel 1 (
			set "DEPENDENCY_ERROR=0"
									call :LOG ║	DEPENDENCY==C??? NO GOD‼ PLEASE NO‼ NOOOOOOOOOO‼‼‼	════╣
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
									   call :LOG ║		Manual diagnostics selected...					║
									   call :LOG ╠══════════════════════════════════════════════════════╣
goto :EOF

:LOGEND
if "!LOG_ENABLED!"=="0" goto :EOF
echo ╚═══════════════════════════════════════════════════════════════════════════════╝>> "mod_sorter.log"
goto :EOF

:LOGENDSUCCESS
if "!LOG_ENABLED!"=="0" goto :EOF
echo ╠════════════════════════╩══════════════════════════════════════════════════════╣>> "mod_sorter.log"
echo ╚══════The Servo-Modquisitor`s task is complete. Glory to the Machine God‼══════╝>> "mod_sorter.log"
goto :EOF

:EOF
exit
