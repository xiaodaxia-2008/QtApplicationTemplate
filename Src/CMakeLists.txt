set(target_name ApplicationName)

file(GLOB_RECURSE srcs CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_LIST_DIR}/*.cpp
    ${CMAKE_CURRENT_LIST_DIR}/*.h
    ${CMAKE_CURRENT_LIST_DIR}/*.ui)

add_executable(${target_name})
set_target_properties(${target_name} PROPERTIES AUTOMOC ON AUTORCC ON AUTOUIC ON)
target_sources(${target_name} PRIVATE ${srcs})
target_link_libraries(${target_name} PRIVATE spdlog::spdlog Qt::Widgets $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:stdc++fs>)
qt_add_resources(${target_name} ${target_name}rccs PREFIX "images" FILES WindowIcon.svg)

install(TARGETS ${target_name}
    RUNTIME_DEPENDENCIES
    PRE_EXCLUDE_REGEXES "^api-ms-.*" "^ext-ms-.*" "^qt.*"
    POST_EXCLUDE_REGEXES ".*Windows[/\\]system32[/\\].*"
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT MainExe
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT MainExe
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT MainExe
)

if(WIN32)
    qt_generate_deploy_app_script(TARGET ${target_name} FILENAME_VARIABLE
        qt_deploy_script NO_UNSUPPORTED_PLATFORM_ERROR)
    install(SCRIPT ${qt_deploy_script} COMPONENT MainExe)
endif()
