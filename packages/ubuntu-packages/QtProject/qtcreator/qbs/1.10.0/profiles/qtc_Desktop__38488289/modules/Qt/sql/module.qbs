import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Sql"
    Depends { name: "Qt"; submodules: ["core"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5Sql"
    libNameForLinkerRelease: "Qt5Sql"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Sql.so.5.9.4"
    cpp.defines: ["QT_SQL_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtSql"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    
}
