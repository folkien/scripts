import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "DataVisualization"
    Depends { name: "Qt"; submodules: ["core", "gui"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5DataVisualization"
    libNameForLinkerRelease: "Qt5DataVisualization"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt5DataVisualization.so.5.9.4"
    cpp.defines: ["QT_DATAVISUALIZATION_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/QtDataVisualization"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib"]
    
}
