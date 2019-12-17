import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Scxml"
    Depends { name: "Qt"; submodules: ["core-private", "qml-private", "scxml"]}

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
    cpp.defines: []
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include/QtScxml/5.9.4", "/opt/Qt5.9.4-i386/include/QtScxml/5.9.4/QtScxml"]
    cpp.libraryPaths: []
    
}
