@echo off

REM https://bitbucket.org/JesusFreke/smali/downloads/

rd /s /q .\supl20\

REM Genere les fichier smali 
REM Need to change location of framework android (vndk26 version huawei)
java -jar baksmali-2.5.2.jar deodex -a 26 -o .\supl20\PRA\src-out -c boot.oat -d  ..\..\huawei-26\framework\arm64 .\original\PRA\gnss_supl20service_hisi.odex

REM Decompile APK, extrait le manifest dans le repertoire cible
java -jar apktool_2.6.0.jar decode -f -o .\supl20\PRA\apk-out .\original\PRA\gnss_supl20service_hisi.apk


REM ---------------------------------------------------------------------------------------


REM Recopie le nouveau fichier CopyArrayMod.smali (fix arraycopy bug java/lang/System)
mkdir .\supl20\PRA\src-out\com\android\altair\
xcopy /Y .\modded\CopyArrayMod.smali .\supl20\PRA\src-out\com\android\altair\

REM ---------------------------------------------------------------------------------------

REM Sous Notepad, remplacer dans tous les fichiers smali, la chaine, a voir si on peut pas le faire avec sed (133 occurences)
REM	Ljava/lang/System;->arraycopy([BI[BII)V 
REM par 
REM	Lcom/android/altair/CopyArrayMod;->CopyArray([BI[BII)V

FOR /R ".\supl20\PRA\src-out" %%f IN (*.smali) DO  (
   echo %%f
   .\sed_winx86_64\sed -i -e "s/Ljava\/lang\/System;->arraycopy(\[BI\[BII)V/Lcom\/android\/altair\/CopyArrayMod;->CopyArray(\[BI\[BII)V/g" %%f
)


REM Fabrique le ficher classes.dex  a partir des fichier smali, android 26
java -jar smali-2.5.2.jar a --api 26 .\supl20\PRA\src-out -o .\supl20\PRA\apk-out\classes.dex
REM java -jar smali-2.5.2.jar a --api 30 .\supl20\PRA\src-out -o .\supl20\PRA\apk-out\classes.dex

REM Recompile APK  dans le repertoire cible
java -jar apktool_2.6.0.jar build -o .\supl20\PRA\recompiled.apk  .\supl20\PRA\apk-out

REM Sign this plateform signature
java -jar "ApkSigner.jar" sign  --key platform.pk8 --cert platform.x509.pem  --v4-signing-enabled false --out ".\supl20\PRA\gnss_supl20service_hisi_signed.apk" ".\supl20\PRA\recompiled.apk"

REM signapk -a 4 $2/shared.x509.pem $2/shared.pk8 HwCamera2.apk HwCamera2.signed.apk


REM Aligne le fichier et le recopie dans le repertoire apk
zipalign -f -p -v 4 .\supl20\PRA\gnss_supl20service_hisi_signed.apk .\apk\gnss_supl20service_hisi.apk

pause

REM envoie le fichier sur le telephone
adb root
adb remount rw, /system
adb push .\apk\gnss_supl20service_hisi.apk /system/app/gnss_supl20service_hisi/gnss_supl20service_hisi.apk

pause