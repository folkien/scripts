import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "TextToSpeech"
    Depends { name: "Qt"; submodules: ["core"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5TextToSpeech"
    libNameForLinkerRelease: "Qt5TextToSpeech"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt5TextToSpeech.so.5.9.4"
    cpp.defines: ["QT_TEXTTOSPEECH_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/QtTextToSpeech"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib"]
    
}
