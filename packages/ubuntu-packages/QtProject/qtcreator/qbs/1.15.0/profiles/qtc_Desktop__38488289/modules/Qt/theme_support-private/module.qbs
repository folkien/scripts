import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "ThemeSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5DBus.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread", "GL"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5ThemeSupport"
    libNameForLinkerRelease: "Qt5ThemeSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5ThemeSupport.a"
    cpp.defines: ["QT_THEME_SUPPORT_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtThemeSupport", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtThemeSupport/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtThemeSupport/5.9.4/QtThemeSupport"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib", "/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    isStaticLibrary: true
}
