import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "GlxSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread", "Xext", "X11", "m", "GL"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5GlxSupport"
    libNameForLinkerRelease: "Qt5GlxSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5GlxSupport.a"
    cpp.defines: ["QT_GLX_SUPPORT_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtGlxSupport", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtGlxSupport/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtGlxSupport/5.9.4/QtGlxSupport"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    isStaticLibrary: true
}
