import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QmlDebug"
    Depends { name: "Qt"; submodules: ["core-private", "network", "packetprotocol-private", "qml-private"]}

    architecture: "x86_64"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5PacketProtocol.a", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Qml.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Network.so.5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5Core.so.5.9.4", "pthread"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5QmlDebug"
    libNameForLinkerRelease: "Qt5QmlDebug"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4/5.9.4/gcc_64/lib/libQt5QmlDebug.a"
    cpp.defines: ["QT_QMLDEBUG_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/include", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtQmlDebug", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtQmlDebug/5.9.4", "/opt/Qt5.9.4/5.9.4/gcc_64/include/QtQmlDebug/5.9.4/QtQmlDebug"]
    cpp.libraryPaths: ["/opt/Qt5.9.4/5.9.4/gcc_64/lib", "/opt/Qt5.9.4/5.9.4/gcc_64/lib"]
    isStaticLibrary: true
}
