import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Multimedia"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private", "multimedia"]}

    architecture: "x86_64"
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
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include/QtMultimedia/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtMultimedia/5.9.4/QtMultimedia"]
    cpp.libraryPaths: []
    
}
