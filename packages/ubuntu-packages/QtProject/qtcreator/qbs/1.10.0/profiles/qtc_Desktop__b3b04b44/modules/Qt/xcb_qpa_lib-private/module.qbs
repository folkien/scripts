import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "XcbQpa"
    Depends { name: "Qt"; submodules: ["core", "gui", "core-private", "gui-private", "service_support-private", "theme_support-private", "eventdispatcher_support-private", "fontdatabase_support-private", "linuxaccessibility_support-private"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt5ServiceSupport.a", "/opt/Qt5.9.4-i386/lib/libQt5ThemeSupport.a", "/opt/Qt5.9.4-i386/lib/libQt5EventDispatcherSupport.a", "gthread-2.0", "glib-2.0", "/opt/Qt5.9.4-i386/lib/libQt5FontDatabaseSupport.a", "qtfreetype", "qtlibpng", "z", "/opt/Qt5.9.4-i386/lib/libQt5LinuxAccessibilitySupport.a", "/opt/Qt5.9.4-i386/lib/libQt5AccessibilitySupport.a", "GL", "/opt/Qt5.9.4-i386/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5DBus.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread", "X11-xcb", "X11", "Xi", "SM", "ICE", "xcb-static", "xcb", "dl"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5XcbQpa"
    libNameForLinkerRelease: "Qt5XcbQpa"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt5XcbQpa.so.5.9.4"
    cpp.defines: ["QT_XCB_QPA_LIB_LIB"]
    cpp.includePaths: []
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib"]
    
}
