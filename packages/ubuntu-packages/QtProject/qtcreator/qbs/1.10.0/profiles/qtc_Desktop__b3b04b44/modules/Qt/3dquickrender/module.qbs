import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "3DQuickRender"
    Depends { name: "Qt"; submodules: ["core", "gui", "qml", "3dcore", "3drender", "3dquick"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt53DRender.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt53DQuick.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt53DCore.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Quick.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Qml.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Network.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Concurrent.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt53DQuickRender"
    libNameForLinkerRelease: "Qt53DQuickRender"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt53DQuickRender.so.5.9.4"
    cpp.defines: ["QT_3DQUICKRENDER_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/Qt3DQuickRender"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib", "/opt/Qt5.9.4-i386/lib", "/opt/Qt5.9.4-i386/lib"]
    
}
