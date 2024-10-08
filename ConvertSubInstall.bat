@echo off
setlocal enabledelayedexpansion

set "path=%~dp0"
set "new_path=%path:\=\\%"
set path=%new_path%
echo %path%

:: Definiowanie zmiennych środowiskowych
set "scriptPath=%path%"
set "regFile=add_context_menu.reg"
set "regFileFullPath=%~dp0%regFile%" 

set "rootKey=HKEY_CLASSES_ROOT\*\shell"
set "subShellKey=HKEY_CLASSES_ROOT\*\shell\ConvertSub\shell"


GOTO:Setup_process


:Setup_process                   
call :Setup_Writing
if not exist "%regFileFullPath%" goto Setup_error
echo %g_%Updating shell extension menu ..%_%
%SystemRoot%\regedit /s "%regFileFullPath%" || goto Setup_error
del "%regFileFullPath%"


:: Function to generate entry for conversion
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

:: Generating .reg file
:Setup_Writing
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
	) > "%regFileFullPath%"

	:: Calling function for each format
	set "formats=srt vtt scc stl sbv sub_subviewer sub_microdvd ass dfxp ttml smi txt_quicktime lrc csv txt"
	set "index=1"
	for %%f in (%formats%) do (
		call :generateConversionEntry !index! %%f >> "%regFileFullPath%"
		set /a "index+=1"
	)
EXIT /B 0

:Setup_error                      
echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo.
echo            %r_%Setup fail.
echo            %w_%Permission denied.
pause>nul&exit

echo Context menu has been added to the registry.
endlocal