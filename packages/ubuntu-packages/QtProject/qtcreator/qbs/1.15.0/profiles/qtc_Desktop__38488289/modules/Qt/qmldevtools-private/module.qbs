import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QmlDevTools"
    Depends { name: "Qt"; submodules: ["core-private"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5QmlDevTools"
    libNameForLinkerRelease: "Qt5QmlDevTools"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5QmlDevTools.a"
    cpp.defines: ["QT_QMLDEVTOOLS_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtQml", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtQml/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtQml/5.9.4/QtQml"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    isStaticLibrary: true
}
