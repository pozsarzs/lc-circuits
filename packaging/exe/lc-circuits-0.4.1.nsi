; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "LC-circuits"
!define PRODUCT_VERSION "0.4.1"
!define PRODUCT_PUBLISHER "Pozsar Zsolt"
!define PRODUCT_WEB_SITE "http:\\www.pozsarzs.hu"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\lc-circuits.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Uninstaller pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "$(MUILicense)" 
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_RUN "$INSTDIR\lc-circuits.exe"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\documents\readme.txt"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Hungarian"

; License Language
LicenseLangString MUILicense ${LANG_ENGLISH} "lc-circuits\documents\copying.txt"
LicenseLangString MUILicense ${LANG_HUNGARIAN} "lc-circuits\documents\copying.txt"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "lc-circuits-0.4.1-win32.exe"
InstallDir "$PROGRAMFILES\LC-circuits"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "Main files" SEC01
  SetOutPath "$INSTDIR\documents"
  SetOverwrite try
  File "lc-circuits\documents\authors.txt"
  File "lc-circuits\documents\changelog.txt"
  File "lc-circuits\documents\copying.txt"
  File "lc-circuits\documents\install.txt"
  File "lc-circuits\documents\readme.txt"
  File "lc-circuits\documents\version.txt"
  SetOutPath "$INSTDIR\documents\hu"
  File "lc-circuits\documents\hu\copying.txt"
  File "lc-circuits\documents\hu\install.txt"
  File "lc-circuits\documents\hu\readme.txt"
  SetOutPath "$INSTDIR\figures"
  File "lc-circuits\figures\module_01.png"
  File "lc-circuits\figures\module_02.png"
  File "lc-circuits\figures\module_03.png"
  File "lc-circuits\figures\module_04.png"
  File "lc-circuits\figures\module_05.png"
  File "lc-circuits\figures\module_06.png"
  File "lc-circuits\figures\module_07.png"
  File "lc-circuits\figures\module_08.png"
  File "lc-circuits\figures\module_09.png"
  File "lc-circuits\figures\module_10.png"
  File "lc-circuits\figures\module_11.png"
  File "lc-circuits\figures\module_12.png"
  File "lc-circuits\figures\module_13.png"
  File "lc-circuits\figures\module_14.png"
  File "lc-circuits\figures\module_15.png"
  File "lc-circuits\figures\module_16.png"
  File "lc-circuits\figures\module_17.png"
  File "lc-circuits\figures\module_18.png"
  File "lc-circuits\figures\module_19.png"
  File "lc-circuits\figures\module_20.png"
  File "lc-circuits\figures\module_21.png"
  File "lc-circuits\figures\module_22.png"
  File "lc-circuits\figures\module_23.png"
  File "lc-circuits\figures\module_24.png"
  File "lc-circuits\figures\module_25.png"
  File "lc-circuits\figures\module_26.png"
  SetOutPath "$INSTDIR\help"
  File "lc-circuits\help\styles.css"
  File "lc-circuits\help\en.html"
  File "lc-circuits\help\en_cmdparams.html"
  File "lc-circuits\help\en_hotkeys.html"
  File "lc-circuits\help\en_intro.html"
  File "lc-circuits\help\hu.html"
  File "lc-circuits\help\hu_cmdparams.html"
  File "lc-circuits\help\hu_hotkeys.html"
  File "lc-circuits\help\hu_intro.html"
  SetOutPath "$INSTDIR"
  File "lc-circuits\lc-circuits.exe"
  File "lc-circuits\readme.txt"
  CreateShortCut "$DESKTOP\LC-circuits.lnk" "$INSTDIR\lc-circuits.exe"
  CreateDirectory "$SMPROGRAMS\LC-circuits"
  CreateShortCut "$SMPROGRAMS\LC-circuits\LC-circuits.lnk" "$INSTDIR\lc-circuits.exe"
SectionEnd

Section "Translate HU" SEC02
  SetOutPath "$INSTDIR\languages\hu"
  File "lc-circuits\languages\hu\lc-circuits.mo"
  File "lc-circuits\languages\hu\lc-circuits.po"
  SetOutPath "$INSTDIR\languages"
  File "lc-circuits\languages\lc-circuits.pot"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  CreateDirectory "$SMPROGRAMS\LC-circuits"
  CreateShortCut "$SMPROGRAMS\LC-circuits\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\lc-circuits.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\lc-circuits.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
  LangString DESC_Section1 ${LANG_ENGLISH} "Required files"
  LangString DESC_Section2 ${LANG_ENGLISH} "Hungarian translate"
  LangString DESC_Section1 ${LANG_HUNGARIAN} "Kötelező állományok"
  LangString DESC_Section2 ${LANG_HUNGARIAN} "Magyar fordítás"
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} $(DESC_Section2)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

; Section uninstall
  Function un.onInit
  !insertmacro MUI_UNGETLANGUAGE
  FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\readme.txt"
  Delete "$INSTDIR\lc-circuits.exe"
  Delete "$INSTDIR\help\styles.css"
  Delete "$INSTDIR\help\en.html"
  Delete "$INSTDIR\help\en_cmdparams.html"
  Delete "$INSTDIR\help\en_hotkeys.html"
  Delete "$INSTDIR\help\en_intro.html"
  Delete "$INSTDIR\help\hu.html"
  Delete "$INSTDIR\help\hu_cmdparams.html"
  Delete "$INSTDIR\help\hu_hotkeys.html"
  Delete "$INSTDIR\help\hu_intro.html"
  Delete "$INSTDIR\figures\module_01.png"
  Delete "$INSTDIR\figures\module_02.png"
  Delete "$INSTDIR\figures\module_03.png"
  Delete "$INSTDIR\figures\module_04.png"
  Delete "$INSTDIR\figures\module_05.png"
  Delete "$INSTDIR\figures\module_06.png"
  Delete "$INSTDIR\figures\module_07.png"
  Delete "$INSTDIR\figures\module_08.png"
  Delete "$INSTDIR\figures\module_09.png"
  Delete "$INSTDIR\figures\module_10.png"
  Delete "$INSTDIR\figures\module_11.png"
  Delete "$INSTDIR\figures\module_12.png"
  Delete "$INSTDIR\figures\module_13.png"
  Delete "$INSTDIR\figures\module_14.png"
  Delete "$INSTDIR\figures\module_15.png"
  Delete "$INSTDIR\figures\module_16.png"
  Delete "$INSTDIR\figures\module_17.png"
  Delete "$INSTDIR\figures\module_18.png"
  Delete "$INSTDIR\figures\module_19.png"
  Delete "$INSTDIR\figures\module_20.png"
  Delete "$INSTDIR\figures\module_21.png"
  Delete "$INSTDIR\figures\module_22.png"
  Delete "$INSTDIR\figures\module_23.png"
  Delete "$INSTDIR\figures\module_24.png"
  Delete "$INSTDIR\figures\module_25.png"
  Delete "$INSTDIR\figures\module_26.png"
  Delete "$INSTDIR\languages\lc-circuits.pot"
  Delete "$INSTDIR\languages\hu\lc-circuits.po"
  Delete "$INSTDIR\languages\hu\lc-circuits.mo"
  Delete "$INSTDIR\documents\authors.txt"
  Delete "$INSTDIR\documents\changelog.txt"
  Delete "$INSTDIR\documents\copying.txt"
  Delete "$INSTDIR\documents\install.txt"
  Delete "$INSTDIR\documents\readme.txt"
  Delete "$INSTDIR\documents\version.txt"
  Delete "$INSTDIR\documents\hu\install.txt"
  Delete "$INSTDIR\documents\hu\readme.txt"
  Delete "$INSTDIR\documents\hu\copying.txt"

  Delete "$SMPROGRAMS\LC-circuits\Uninstall.lnk"
  Delete "$DESKTOP\LC-circuits.lnk"
  Delete "$SMPROGRAMS\LC-circuits\LC-circuits.lnk"

  RMDir "$SMPROGRAMS\LC-circuits"
  RMDir "$INSTDIR\help"
  RMDir "$INSTDIR\figures"
  RMDir "$INSTDIR\languages\hu"
  RMDir "$INSTDIR\languages"
  RMDir "$INSTDIR\documents\hu"
  RMDir "$INSTDIR\documents"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
