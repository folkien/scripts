import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "WebEngineWidgets"
    Depends { name: "Qt"; submodules: ["core", "gui", "webenginecore", "widgets", "network", "quick", "printsupport"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5WebEngineCore.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Quick.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5PrintSupport.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Widgets.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5WebChannel.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Qml.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Network.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Positioning.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5WebEngineWidgets"
    libNameForLinkerRelease: "Qt5WebEngineWidgets"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5WebEngineWidgets.so.5.9.4"
    cpp.defines: ["QT_WEBENGINEWIDGETS_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtWebEngineWidgets"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib", "/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    
}
