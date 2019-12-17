import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Charts"
    Depends { name: "Qt"; submodules: ["core", "gui", "widgets"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt5Widgets.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5Charts"
    libNameForLinkerRelease: "Qt5Charts"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt5Charts.so.5.9.4"
    cpp.defines: ["QT_CHARTS_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/QtCharts"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib"]
    
}
