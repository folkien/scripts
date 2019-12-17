import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "FbSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread", "GL"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5FbSupport"
    libNameForLinkerRelease: "Qt5FbSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5FbSupport.a"
    cpp.defines: ["QT_FB_SUPPORT_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtFbSupport", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtFbSupport/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtFbSupport/5.9.4/QtFbSupport"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    isStaticLibrary: true
}
