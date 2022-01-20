"# 7zip-repack" 

Test1 - pipe-based repack to APPEND file to solid .tar.7z archive
	
	Linux
	
		```
		export INARCHNAME="test1in.tar.7z"
		export ARCPARAMS=-t7z -m0=lzma2 -mx=9 -mfb=273 -md=4g -mmt=3 -ms=16777215t -mqs=on -slp #just some params for maximum compression

		#test1 - inline append ./src/4.txt to .tar.7z
		(7z x $INARCHNAME -so | head -c -512 ; tar -C src -cf - 4.txt | cat) | 7z a -si $ARCPARAMS out_test1.tar.7z
		```

	Windows
	
		```
		set INARCHNAME="test1in.tar.7z"
		set ARCPARAMS="-t7z" "-m0=lzma2" "-mx=9" "-mfb=273" "-md=4g" "-mmt=3" "-ms=16777215t" "-mqs=on" "-slp"


		("c:\Program Files\7-Zip\7z.exe" x %INARCHNAME% -so | "c:\cygwin64\bin\head" -c -512 && tar -C src -cf - 4.txt | "c:\cygwin64\bin\cat") | "c:\Program Files\7-Zip\7z.exe" a -si %ARCPARAMS% out_test1.tar.7z
		```









Exctract Test1 - 1 step extract single files from .tar.7z - via TAR

```
export INARCHNAME="out_test1.tar.7z"
7z x $INARCHNAME -so | tar -xvv 3.txt
```

Exctract Test2 - 1 step extract single files from .tar.7z - via 7z

```
export INARCHNAME="out_test1.tar.7z"
7z x $INARCHNAME -so | 7z x -aoa -si -ttar 2.txt
```