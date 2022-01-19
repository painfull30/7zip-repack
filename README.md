"# 7zip-repack" 

Test1 - pipe-based repack to APPEND file to solid .tar.7z archive

```
export INARCHNAME="test1in.tar.7z"
export ARCPARAMS=-t7z -m0=lzma2 -mx=9 -mfb=273 -md=4g -mmt=3 -ms=16777215t -mqs=on -slp #just some params for maximum compression

#test1 - inline append ./src/4.txt to .tar.7z
(7z x $INARCHNAME -so | head -c -512 ; tar -C src -cf - 4.txt | cat) | 7z a -si $ARCPARAMS out_test1.tar.7z
```
