@echo off
FOR /R ".\supl20\PRA\src-out" %%f IN (*.smali) DO  (
   echo %%f
   .\sed_winx86_64\sed -i -e "s/Ljava\/lang\/System;->arraycopy(\[BI\[BII)V/Lcom\/android\/altair\/CopyArrayMod;->CopyArray(\[BI\[BII)V/g" %%f
)
pause