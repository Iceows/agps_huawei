
REM List le contenu du dex 
java -jar baksmali-2.5.2.jar list dex .\supl20\FIG\gnss_supl20service_hisi.odex

REM Genere les fichier smali 
java -jar baksmali-2.5.2.jar deodex -a 27 -o .\supl20\FIG\src-out -c boot.oat -d ..\..\sdk27\framework\arm64 .\supl20\FIG\gnss_supl20service_hisi.odex

REM Decompile APK, extrait le manifest dans le repertoire cible
java -jar apktool_2.6.0.jar decode -f -t "27"  -o .\supl20\FIG\apk-out .\supl20\FIG\gnss_supl20service_hisi.apk


REM ---------------------------------------------------------------------------------------


REM Fait un peu de menage
rd /s /q .\supl20-new\apk-out

REM Genere les fichiers smali du patch
java -jar apktool_2.6.0.jar decode -f -o .\supl20-new\apk-out .\supl20\app-release-unsigned.apk

REM Recopie le nouveau fichier CopyArrayMod.smali
mkdir .\supl20\FIG\src-out\com\android\altair\
xcopy /Y .\supl20-new\apk-out\smali\com\android\altair\CopyArrayMod.smali .\supl20\FIG\src-out\com\android\altair\

REM ---------------------------------------------------------------------------------------

REM Sous Notepad, remplacer dans tous les fichiers smali, la chaine, a voir si on peut pas le faire avec sed (133 occurences)
REM	Ljava/lang/System;->arraycopy([BI[BII)V 
REM par 
REM	Lcom/android/altair/CopyArrayMod;->CopyArray([BI[BII)V

REM Fabrique le ficher classes.dex  a partir des fichier smali, android 26
java -jar smali-2.5.2.jar a --api 26 .\supl20\FIG\src-out -o .\supl20\FIG\apk-out\classes.dex
REM java -jar smali-2.5.2.jar a --api 30 .\supl20\FIG\src-out -o .\supl20\FIG\apk-out\classes.dex

REM Recompile APK  dans le repertoire cible
java -jar apktool_2.6.0.jar build -o .\supl20\FIG\recompiled.apk  .\supl20\FIG\apk-out

REM Sign this plateform signature
java -jar "ApkSigner.jar" sign  --key platform.pk8 --cert platform.x509.pem  --v4-signing-enabled false --out ".\supl20\FIG\gnss_supl20service_hisi_signed.apk" ".\supl20\FIG\recompiled.apk"

REM Recopie
xcopy /Y .\supl20\FIG\gnss_supl20service_hisi_signed.apk .\apk\gnss_supl20service_hisi.apk

REM envoie le fichier sur le telephone
adb root
adb remount rw, /system
adb push .\apk\gnss_supl20service_hisi.apk /system/app/gnss_supl20service_hisi/gnss_supl20service_hisi.apk

REM End