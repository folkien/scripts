import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "RepParser"
    Depends { name: "Qt"; submodules: ["core"]}

    architecture: "x86"
    hasLibrary: false
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: ""
    libNameForLinkerRelease: ""
    libFilePathDebug: ""
    libFilePathRelease: ""
    cpp.defines: ["QT_REPPARSER_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/QtRepParser"]
    cpp.libraryPaths: []
    
}
