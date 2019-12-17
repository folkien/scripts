import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Bootstrap"
    Depends { name: "Qt"; submodules: []}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["pthread", "z"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5Bootstrap"
    libNameForLinkerRelease: "Qt5Bootstrap"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Bootstrap.a"
    cpp.defines: ["QT_BOOTSTRAP_LIB", "QT_VERSION_STR=\\'\\\"5.9.4\\\"\\'", "QT_VERSION_MAJOR=5", "QT_VERSION_MINOR=9", "QT_VERSION_PATCH=4", "QT_BOOTSTRAPPED", "QT_NO_CAST_TO_ASCII"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtCore", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtCore/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtCore/5.9.4/QtCore", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtXml", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtXml/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtXml/5.9.4/QtXml"]
    cpp.libraryPaths: []
    isStaticLibrary: true
}
