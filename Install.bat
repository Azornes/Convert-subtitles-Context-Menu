@echo off
setlocal enabledelayedexpansion

set "path=%~dp0"
set "new_path=%path:\=\\%"
set path=%new_path%
echo %path%

:: Definiowanie zmiennych środowiskowych
set "scriptPath=%path%"
set "regFile=add_context_menu.reg"
set "rootKey=HKEY_CLASSES_ROOT\*\shell"
set "subShellKey=HKEY_CLASSES_ROOT\*\shell\ConvertSub\shell"

GOTO:MAIN
:: Funkcja do generowania wpisu dla konwersji
:generateConversionEntry
    SETLOCAL ENABLEDELAYEDEXPANSION
		set "index=%~1"
		set "format=%~2"
		if !index! lss 10 (
			set "index=0!index!"
		)
		
		(
			echo [!subShellKey!\Item%index%]
			echo "MUIVerb"="Convert to .%format%"
			echo [!subShellKey!\Item%index%\command]
			echo @="%scriptPath%convert_subs.bat \"%%1\" %format%"
			echo.
		)
	ENDLOCAL
EXIT /B 0

:MAIN
:: Generowanie pliku .reg
(
    echo Windows Registry Editor Version 5.00
    echo.
    echo [%rootKey%]
    echo.
    echo [%rootKey%\ConvertSub]
    echo "MUIVerb"="Convert Subtitles"
    echo "AppliesTo"="System.FileName:\"*.srt\" OR System.FileName:\"*.vtt\" OR System.FileName:\"*.scc\" OR System.FileName:\"*.stl\" OR System.FileName:\"*.sbv\" OR System.FileName:\"*.sub\" OR System.FileName:\"*.ass\" OR System.FileName:\"*.dfxp\" OR System.FileName:\"*.ttml\" OR System.FileName:\"*.smi\" OR System.FileName:\"*.qt.txt\" OR System.FileName:\"*.rtf\" OR System.FileName:\"*.docx\" OR System.FileName:\"*.lrc\" OR System.FileName:\"*.csv\" OR System.FileName:\"*.txt\""
    echo "SubCommands"=""
    echo.
    echo [%subShellKey%]
    echo.
	
	echo [!subShellKey!\Item0]
	echo "MUIVerb"="Convert to all formats"
	echo [!subShellKey!\Item0\command]
	echo @="%scriptPath%convert_subs.bat \"%%1\" \"srt vtt scc stl sbv sub_subviewer sub_microdvd ass dfxp ttml smi txt_quicktime lrc csv txt\""
	echo.	
) > "%regFile%"

:: Wywołanie funkcji dla każdego formatu
set "formats=srt vtt scc stl sbv sub_subviewer sub_microdvd ass dfxp ttml smi txt_quicktime lrc csv txt"
set "index=1"
for %%f in (%formats%) do (
    call :generateConversionEntry !index! %%f >> "%regFile%"
    set /a "index+=1"
)

:: Importowanie pliku .reg do rejestru
:: regedit /s "%regFile%"
echo Kontekstowe menu zostało dodane do rejestru.
endlocal