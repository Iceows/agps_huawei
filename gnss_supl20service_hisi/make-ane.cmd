
del .\supl20\ANE\gnss_supl20service_hisi.apk_classes.dex
".\vdexExtractor_winx86_64\vdexExtractor.exe" -i .\supl20\ANE\gnss_supl20service_hisi.vdex

del .\supl20\ANE\gnss_supl20service_hisi.apk_classes-dex2jar.jar
".\dex2jar\d2j-dex2jar.bat" .\supl20\ANE\gnss_supl20service_hisi.apk_classes.dex -o .\supl20\ANE\gnss_supl20service_hisi.apk_classes-dex2jar.jar

del gnss_supl20service_hisi_iceows.jar
".\dex2jar\d2j-class-version-switch.bat" 8 ".\supl20\ANE\gnss_supl20service_hisi.apk_classes-dex2jar.jar" -o .\supl20\ANE\gnss_supl20service_hisi_iceows.jar

REM Supprime les deux repertoires
REM ".\zip.exe" -qd gnss_supl20service_hisi_iceows.jar "android/*" "com/*"

pause

