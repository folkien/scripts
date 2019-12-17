import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "EventDispatcherSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt5Gui.so.5.9.4", "/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread", "GL", "gthread-2.0", "glib-2.0"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5EventDispatcherSupport"
    libNameForLinkerRelease: "Qt5EventDispatcherSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt5EventDispatcherSupport.a"
    cpp.defines: ["QT_EVENTDISPATCHER_SUPPORT_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/QtEventDispatcherSupport", "/opt/Qt5.9.4-i386/include/QtEventDispatcherSupport/5.9.4", "/opt/Qt5.9.4-i386/include/QtEventDispatcherSupport/5.9.4/QtEventDispatcherSupport"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib"]
    isStaticLibrary: true
}
