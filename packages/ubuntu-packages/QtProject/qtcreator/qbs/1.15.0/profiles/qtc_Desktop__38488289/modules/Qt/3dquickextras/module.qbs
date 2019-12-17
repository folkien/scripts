import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "3DQuickExtras"
    Depends { name: "Qt"; submodules: ["core", "gui", "qml", "3dcore", "3dinput", "3dquick", "3drender", "3dlogic", "3dextras"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt53DExtras.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt53DInput.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt53DQuick.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt53DRender.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt53DLogic.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt53DCore.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Gamepad.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Quick.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Qml.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Network.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Concurrent.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt53DQuickExtras"
    libNameForLinkerRelease: "Qt53DQuickExtras"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt53DQuickExtras.so.5.9.4"
    cpp.defines: ["QT_3DQUICKEXTRAS_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/Qt3DQuickExtras"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib", "/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    
}
