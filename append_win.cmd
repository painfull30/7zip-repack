@echo on
setlocal enabledelayedexpansion

set PATH=%PATH%;C:\cygwin64\bin;"c:\Program Files\7-Zip\"

set INARCHNAME="append_to_this_archive.tar.7z"
set ARCPARAMS="-t7z" "-m0=lzma2" "-mx=9" "-mfb=273" "-md=4g" "-mmt=3" "-ms=16777215t" "-mqs=on" "-slp"
set FILETOADD="*"

if not exist %INARCHNAME% (
	tar -cf empty.tar
	7z a empty.tar.7z empty.tar
	rm empty.tar
)

rm -f out_%INARCHNAME%
(7z.exe x %INARCHNAME% -so | head -c -512 && tar --blocking-factor=1 -C src -cf - %FILETOADD% | cat) | 7z.exe u -si %ARCPARAMS% out_%INARCHNAME%
mv out_%INARCHNAME% %INARCHNAME%
rm -f empty.tar.7z

endlocal
pause