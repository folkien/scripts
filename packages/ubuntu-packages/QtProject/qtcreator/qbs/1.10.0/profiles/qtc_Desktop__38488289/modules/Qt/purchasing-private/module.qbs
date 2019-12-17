import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Purchasing"
    Depends { name: "Qt"; submodules: ["purchasing"]}

    architecture: "x86_64"
    hasLibrary: false
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: ""
    libNameForLinkerRelease: ""
    libFilePathDebug: ""
    libFilePathRelease: ""
    cpp.defines: []
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include/QtPurchasing/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtPurchasing/5.9.4/QtPurchasing"]
    cpp.libraryPaths: []
    
}
