set(target assimp3DModelLoaderExample)
add_executable(${target})

target_link_libraries(${target} PRIVATE openFrameworks)
find_package(GLEW REQUIRED)
target_link_libraries(${target} PRIVATE GLEW::GLEW)
find_package(utf8cpp CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE utf8::cpp utf8cpp::utf8cpp)
set(nlohmann-json_IMPLICIT_CONVERSIONS OFF)
find_package(nlohmann_json CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE nlohmann_json::nlohmann_json)

set_target_properties(${target} PROPERTIES
    FOLDER "Examples/3D"
)

add_subdirectory(src)

# copy data directory

add_custom_command(TARGET ${target} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory 
        ${CMAKE_CURRENT_SOURCE_DIR}/bin/data
        $<TARGET_FILE_DIR:${target}>/data)
