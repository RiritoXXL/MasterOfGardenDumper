SetCompressor /SOLID lzma
OutFile "TheEminenceInShadow_DumperSetup.exe"
!include "MUI.nsh"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
Name "MOGDumper"
;--------------------------------
; Required for big packages only
 
ReserveFile "${NSISDIR}\Plugins\x86-unicode\System.dll"

Function .onInit

  InitPluginsDir
  File /oname=$PLUGINSDIR\TheEminenceinShadow_GrayscaleDominator.wav "TheEminenceinShadow_GrayscaleDominator.wav"
 
; Play the sound or song
  StrCpy $0 "$PLUGINSDIR\TheEminenceinShadow_GrayscaleDominator.wav"  ; location of the wav file
  IntOp $1 "SND_LOOP" || 1
  System::Call 'winmm::PlaySound(t r0, i 0, i r1) b'
 
FunctionEnd

Section 01
    SetOutPath "F:\MOGDumperByRiritoXXL"
    InitPluginsDir
    File /r "C:\MOGDumper\*.*"
SectionEnd