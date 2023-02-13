# ############ Package Scripts ##############
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VENDOR "ValveWizard Inc.")

set(CPACK_GENERATOR "IFW") # IFW is Qt installation framework

# for IFW package, https://cmake.org/cmake/help/latest/cpack_gen/ifw.html
set(CPACK_IFW_ROOT "C:/Qt/Tools/QtInstallerFramework/4.4")
set(CPACK_IFW_VERBOSE ON)
set(CPACK_IFW_PACKAGE_TITLE "${PROJECT_NAME} Installer")
set(CPACK_IFW_PACKAGE_START_MENU_DIRECTORY "${PROJECT_NAME} ${PROJECT_VERSION}")
set(CPACK_IFW_PACKAGE_MAINTENANCE_TOOL_NAME "${PROJECT_NAME} Maintenance Tool")

include(CPack)
include(CPackIFW)

# # https://cmake.org/cmake/help/latest/module/CPackComponent.html
cpack_add_component(MainExe
  DISPLAY_NAME "${PROJECT_NAME} main executable"
  DESCRIPTION "For general users")

# # https://cmake.org/cmake/help/latest/module/CPackIFW.html
cpack_ifw_configure_component(MainExe
  SCRIPT ${CMAKE_SOURCE_DIR}/Packaging/Shortcut.qs)
