if(CURA_BUILDTYPE STREQUAL "")
    cpack_add_component(_cura
                DISPLAY_NAME "Dynamical 3D Slicer"
                Description "Dynamical 3D Slicer Executable and Data Files"
                REQUIRED
    )
else()
    cpack_add_component(_cura
                DISPLAY_NAME "Dynamical 3D Slicer ${CURA_BUILDTYPE}"
                Description "Dynamical 3D Slicer ${CURA_BUILDTYPE} Executable and Data Files"
                REQUIRED
    )
endif()

# ========================================
# CPack Common Settings
# ========================================

if(CURA_BUILDTYPE STREQUAL "")
    set(CPACK_PACKAGE_NAME "Dynamical 3D Slicer")
else()
    set(CPACK_PACKAGE_NAME "Dynamical 3D Slicer ${CURA_BUILDTYPE}")
endif()
string(REPLACE " " "_" CPACK_FILE_NAME_NO_SPACES "${CPACK_PACKAGE_NAME}")

set(CPACK_PACKAGE_VENDOR "Ultimaker B.V.")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/vfrisach/Cura")

# MSI only supports version format like "x.x.x.x" where x is an integer from 0 to 65534
set(CPACK_PACKAGE_VERSION_MAJOR ${CURA_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${CURA_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${CURA_VERSION_PATCH})

# Use full version x.x.x string in install directory for both installers,
# so that IT can easily automatically upgrade to a newer patch version,
# but also uninstall only the desired EXE installation. Also differentiate
# betweem build types
set(CURA_FULL_VERSION "${CURA_VERSION_MAJOR}.${CURA_VERSION_MINOR}.${CURA_VERSION_PATCH}")
if(CURA_BUILDTYPE STREQUAL "")
    set(CPACK_PACKAGE_NAME "Dynamical 3D Slicer ${CURA_FULL_VERSION}")
else()
    set(CPACK_PACKAGE_NAME "Dynamical 3D Slicer ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")
endif()

set(CPACK_PACKAGE_ICON "${CMAKE_SOURCE_DIR}/packaging/cura.ico")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Dynamical 3D Slicer - 3D Printing Software")
set(CPACK_PACKAGE_CONTACT "Victor Frisach <victor.frisach@apser.es>")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/packaging/cura_license.txt")

# Differentiate between a normal Cura installation and that of a different build type
if(CURA_BUILDTYPE STREQUAL "")
    set(CPACK_CREATE_DESKTOP_LINKS Cura "Dynamical 3D Slicer ${CURA_FULL_VERSION}")
    set(CPACK_PACKAGE_EXECUTABLES Cura "Dynamical 3D Slicer ${CURA_FULL_VERSION}")
    set(CPACK_PACKAGE_INSTALL_DIRECTORY "Dynamical 3D Slicer ${CURA_FULL_VERSION}")
else()
    set(CPACK_CREATE_DESKTOP_LINKS Cura "Dynamical 3D Slicer ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")
    set(CPACK_PACKAGE_EXECUTABLES Cura "Dynamical 3D Slicer ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")
    set(CPACK_PACKAGE_INSTALL_DIRECTORY "Dynamical 3D Slicer ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")
endif()

# Forcing the CPack System Name to be either win32 or win64 for consistency purposes
if(CMAKE_SYSTEM_PROCESSOR MATCHES "AMD64")
    set(CPACK_SYSTEM_NAME "win64")
else()
    set(CPACK_SYSTEM_NAME "win32")
endif()
set(CPACK_PACKAGE_FILE_NAME "${CPACK_FILE_NAME_NO_SPACES}-${CURA_VERSION_MAJOR}.${CURA_VERSION_MINOR}.${CURA_VERSION_PATCH}-${CPACK_SYSTEM_NAME}")
