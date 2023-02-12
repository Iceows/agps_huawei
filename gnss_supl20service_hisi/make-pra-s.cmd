@echo off
@echo "Methode VDEX"


rd /s /q .\supl20\

REM Converti les vdex en dex
.\vdexExtractor_winx86_64\vdexExtractor.exe -f -v 4 -i .\original\PRA\gnss_supl20service_hisi.vdex 

REM Genere les fichiers smali 
java -jar baksmali-2.5.2.jar deodex -a 26 -o .\supl20\PRA\src-out2 -b  ..\..\vendor_hi6250\sdk26\framework\arm64\boot.oat ".\original\PRA\gnss_supl20service_hisi.apk_classes.dex"

REM Supprime les deux repertoires
REM ".\zip.exe" -qd gnss_supl20service_hisi_iceows.jar "android/*" "com/*"

REM Decompile APK, extrait le manifest dans le repertoire cible
java -jar apktool_2.6.0.jar decode -f -o .\supl20\PRA\apk-out2 .\original\PRA\gnss_supl20service_hisi.apk


REM ---------------------------------------------------------------------------------------


REM Fait un peu de menage
rd /s /q .\supl20-new\

REM Genere les fichiers smali du patch
java -jar apktool_2.6.0.jar decode -f -o .\supl20-new\apk-out .\original\app-release.apk

REM Recopie le nouveau fichier CopyArrayMod.smali
mkdir .\supl20\PRA\src-out2\com\android\altair\
xcopy /Y .\supl20-new\apk-out\smali\com\android\altair\CopyArrayMod.smali .\supl20\PRA\src-out2\com\android\altair\


REM ---------------------------------------------------------------------------------------


REM Sous Notepad, remplacer dans tous les fichiers smali, la chaine, a voir si on peut pas le faire avec sed (133 occurences)
REM	Ljava/lang/System;->arraycopy([BI[BII)V
REM par 
REM	Lcom/android/altair/CopyArrayMod;->CopyArray([BI[BII)V

FOR /R ".\supl20\PRA\src-out2" %%f IN (*.smali) DO  (
   sed-4.7-x64.exe -i -e "s/Ljava\/lang\/System;->arraycopy(\[BI\[BII)V/Lcom\/android\/altair\/CopyArrayMod;->CopyArray(\[BI\[BII)V/g" %%f
)


REM Recopie le nouveau fichier ConfigManager avec le chemin vers system
REM "/system/etc/gnss/config/gnss_suplconfig_hisi.xml"
xcopy /Y .\modded\ConfigManager.smali  .\supl20\PRA\src-out2\com\android\supl\config\

REM Fabrique le ficher classes.dex  a partir des fichier smali, android 26
java -jar smali-2.5.2.jar a --api 26 .\supl20\PRA\src-out2 -o .\supl20\PRA\apk-out2\classes.dex

REM Recopie le nouveau fichier AndroidManifest.xml
xcopy /Y .\modded\AndroidManifest.xml  .\supl20\PRA\apk-out2\AndroidManifest.xml



REM Recompile APK  dans le repertoire cible
java -jar apktool_2.6.0.jar build -o .\supl20\PRA\recompiled.apk  .\supl20\PRA\apk-out2

REM Sign this plateform signature
java -jar "ApkSigner.jar" sign  --key platform.pk8 --cert platform.x509.pem  --v4-signing-enabled false --out ".\supl20\PRA\gnss_supl20service_hisi_signed.apk" ".\supl20\PRA\recompiled.apk"

REM Recopie
del .\apk\gnss_supl20service_hisi.apk
REM xcopy /Y .\supl20\PRA\gnss_supl20service_hisi_signed.apk .\apk\gnss_supl20service_hisi.apk
zipalign -f -p -v 4 .\supl20\PRA\gnss_supl20service_hisi_signed.apk .\apk\gnss_supl20service_hisi.apk

REM envoie le fichier sur le telephone
adb root
adb remount rw, /system
adb push .\apk\gnss_supl20service_hisi.apk /system/app/gnss_supl20service_hisi/gnss_supl20service_hisi.apk

REM End
