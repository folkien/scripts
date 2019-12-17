import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "DeviceDiscoverySupport"
    Depends { name: "Qt"; submodules: ["core-private"]}

    architecture: "x86"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/opt/Qt5.9.4-i386/lib/libQt5Core.so.5.9.4", "pthread", "udev"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5DeviceDiscoverySupport"
    libNameForLinkerRelease: "Qt5DeviceDiscoverySupport"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/Qt5.9.4-i386/lib/libQt5DeviceDiscoverySupport.a"
    cpp.defines: ["QT_DEVICEDISCOVERY_SUPPORT_LIB"]
    cpp.includePaths: ["/opt/Qt5.9.4-i386/include", "/opt/Qt5.9.4-i386/include/QtDeviceDiscoverySupport", "/opt/Qt5.9.4-i386/include/QtDeviceDiscoverySupport/5.9.4", "/opt/Qt5.9.4-i386/include/QtDeviceDiscoverySupport/5.9.4/QtDeviceDiscoverySupport"]
    cpp.libraryPaths: ["/opt/Qt5.9.4-i386/lib"]
    isStaticLibrary: true
}
