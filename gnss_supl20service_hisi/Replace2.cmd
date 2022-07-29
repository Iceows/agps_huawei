@echo off
FOR /R ".\supl20\PRA\src-out2" %%f IN (*.smali) DO  (
   echo %%f
   sed-4.7-x64.exe -i -e "s/Ljava\/lang\/System;->arraycopy(\[BI\[BII)V/Lcom\/android\/altair\/CopyArrayMod;->CopyArray(\[BI\[BII)V/g" %%f
)
pause