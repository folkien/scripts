import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "PlatformCompositorSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread", "GL"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5PlatformCompositorSupport"
    libNameForLinkerRelease: "Qt5PlatformCompositorSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt5PlatformCompositorSupport.a"
    cpp.defines: ["QT_PLATFORMCOMPOSITOR_SUPPORT_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/QtPlatformCompositorSupport", "/opt/Qt5.9.4-i386/include/QtPlatformCompositorSupport/5.9.4", "/opt/Qt5.9.4-i386/include/QtPlatformCompositorSupport/5.9.4/QtPlatformCompositorSupport"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib"]
    isStaticLibrary: true
}
