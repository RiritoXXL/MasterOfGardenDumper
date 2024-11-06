SetCompressor /SOLID lzma
OutFile "TheEminenceInShadowMOG_DumperSetup.exe"
!include "MUI.nsh"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "GPL30.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
!define SND_ASYNCLOOP 0x0009
Name "MOGDumper"
BrandingText "MasterOfGardenDumper"
;--------------------------------
; Required for big packages only
 
ReserveFile "${NSISDIR}\Plugins\x86-unicode\System.dll"

Function .onInit

  InitPluginsDir
  File /oname=$PLUGINSDIR\TheEminenceinShadow_GrayscaleDominator.wav "TheEminenceinShadow_GrayscaleDominator.wav"
 
; Play the sound or song
  StrCpy $0 "$PLUGINSDIR\TheEminenceinShadow_GrayscaleDominator.wav"  ; location of the wav file
  System::Call 'winmm::PlaySound(t r0, i 0, i ${SND_ASYNCLOOP}) b'
 
FunctionEnd

Section 01
    InitPluginsDir
    SetOutPath "F:\MOGDumperByRiritoXXL"
    File /r "C:\MOGDumper\*.*"
SectionEnd
