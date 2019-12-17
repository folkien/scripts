import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "3DAnimation"
    Depends { name: "Qt"; submodules: ["core", "gui", "3dcore", "3drender"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt53DRender.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt53DCore.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Network.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Concurrent.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt53DAnimation"
    libNameForLinkerRelease: "Qt53DAnimation"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt53DAnimation.so.5.9.4"
    cpp.defines: ["QT_3DANIMATION_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/Qt3DAnimation"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib", "/opt/Qt5.9.4-i386/lib"]
    
}
