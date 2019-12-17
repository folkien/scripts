import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "MultimediaWidgets"
    Depends { name: "Qt"; submodules: ["multimedia-private", "widgets-private", "multimediawidgets"]}

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
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include/QtMultimediaWidgets/5.9.4", "/opt/Qt5.9.4-i386/include/QtMultimediaWidgets/5.9.4/QtMultimediaWidgets"]
    cpp.libraryPaths: []
    
}
