REM Converti les vdex en dex
".\vdexExtractor_winx86_64\vdexExtractor.exe" -f -v 4 -i .\supl20\ANE\gnss_supl20service_hisi.vdex 

REM Genere les fichiers smali 
".\dex2jar\d2j-dex2smali.bat" -f ".\supl20\ANE\gnss_supl20service_hisi.apk_classes.dex" -o .\supl20\ANE\src-out2

REM Decompile APK, extrait le manifest dans le repertoire cible
java -jar apktool_2.6.0.jar decode -f -o .\supl20\ANE\apk-out2 .\supl20\ANE\gnss_supl20service_hisi.apk

pause

REM ---------------------------------------------------------------------------------------

