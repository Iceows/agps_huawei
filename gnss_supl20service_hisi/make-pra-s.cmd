REM Converti les vdex en dex
".\vdexExtractor_winx86_64\vdexExtractor.exe" -f -v 4 -i .\supl20\PRA\gnss_supl20service_hisi.vdex 

REM Genere les fichiers smali 
".\dex2jar\d2j-dex2smali.bat" -f ".\supl20\PRA\gnss_supl20service_hisi.apk_classes.dex" -o .\supl20\PRA\src-out2

REM ".\dex2jar\d2j-dex2jar.bat" -f .\supl20\PRA\gnss_supl20service_hisi.apk_classes.dex -o .\supl20\PRA\gnss_supl20service_hisi.apk_classes-dex2jar.jar
REM switch to version 8 of java
REM del ".\supl20\PRA\gnss_supl20service_hisi_iceows.jar"
REM ".\dex2jar\d2j-class-version-switch.bat" 8 ".\supl20\PRA\gnss_supl20service_hisi.apk_classes-dex2jar.jar" ".\supl20\PRA\gnss_supl20service_hisi_iceows.jar"
REM xcopy ".\supl20\PRA\gnss_supl20service_hisi.apk_classes-dex2jar.jar" ".\supl20\PRA\gnss_supl20service_hisi_iceows.jar"

REM Supprime les deux repertoires
REM ".\zip.exe" -qd gnss_supl20service_hisi_iceows.jar "android/*" "com/*"

REM Decompile APK, extrait le manifest dans le repertoire cible
java -jar apktool_2.6.0.jar decode -f -o .\supl20\PRA\apk-out2 .\supl20\PRA\gnss_supl20service_hisi.apk

pause

REM ---------------------------------------------------------------------------------------


REM Fait un peu de menage
rd /s /q .\supl20-new\apk-out

REM Genere les fichiers smali du patch
java -jar apktool_2.6.0.jar decode -f -o .\supl20-new\apk-out .\supl20\app-release.apk

REM Recopie le nouveau fichier CopyArrayMod.smali
mkdir .\supl20\PRA\src-out2\com\android\altair\
xcopy /Y .\supl20-new\apk-out\smali\com\android\altair\CopyArrayMod.smali .\supl20\PRA\src-out2\com\android\altair\

REM ---------------------------------------------------------------------------------------

REM Sous Notepad, remplacer dans tous les fichiers smali, la chaine, a voir si on peut pas le faire avec sed (133 occurences)
REM	Ljava/lang/System;->arraycopy([BI[BII)V
REM par 
REM	Lcom/android/altair/CopyArrayMod;->CopyArray([BI[BII)V

REM Fabrique le ficher classes.dex  a partir des fichier smali, android 26
".\dex2jar\d2j-smali.bat" --api-level 26 .\supl20\PRA\src-out2 -o .\supl20\PRA\apk-out2\classes.dex

REM Recompile APK  dans le repertoire cible
java -jar apktool_2.6.0.jar build -o .\supl20\PRA\recompiled.apk  .\supl20\PRA\apk-out2

REM Sign this plateform signature
java -jar "ApkSigner.jar" sign  --key platform.pk8 --cert platform.x509.pem  --v4-signing-enabled false --out ".\supl20\PRA\gnss_supl20service_hisi_signed.apk" ".\supl20\PRA\recompiled.apk"

REM Recopie
xcopy /Y .\supl20\PRA\gnss_supl20service_hisi_signed.apk .\apk\gnss_supl20service_hisi.apk

REM envoie le fichier sur le telephone
adb root
adb remount rw, /system
adb push .\apk\gnss_supl20service_hisi.apk /system/app/gnss_supl20service_hisi/gnss_supl20service_hisi.apk

REM End
