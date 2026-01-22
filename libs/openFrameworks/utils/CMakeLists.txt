if(NOT OF_BUILD_SINGLE_LIB)

set(target utils)
add_library(${target})

# find_package(glm CONFIG REQUIRED)
# target_link_libraries(${target} PRIVATE glm::glm)
# find_package(unofficial-libtess2 CONFIG REQUIRED)
# target_link_libraries(${target} PRIVATE unofficial::libtess2::libtess2)
find_package(utf8cpp CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE utf8::cpp utf8cpp::utf8cpp)
find_package(GLEW REQUIRED)
target_link_libraries(${target} PRIVATE GLEW::GLEW)
find_package(pugixml CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE pugixml::static pugixml::pugixml)

target_include_directories(${target} PRIVATE
    # ${openFrameworks_SOURCE_DIR}/3d
    ${openFrameworks_SOURCE_DIR}/app
    ${openFrameworks_SOURCE_DIR}/events
    ${openFrameworks_SOURCE_DIR}/gl
    ${openFrameworks_SOURCE_DIR}/graphics
    ${openFrameworks_SOURCE_DIR}/math
    # ${openFrameworks_SOURCE_DIR}/sound
    ${openFrameworks_SOURCE_DIR}/types
    ${openFrameworks_SOURCE_DIR}/utils
    # ${openFrameworks_SOURCE_DIR}/video
)
endif(NOT OF_BUILD_SINGLE_LIB)

target_sources(${target} PRIVATE
    ofFileUtils.cpp
    ofFpsCounter.cpp
    ofLog.cpp
    ofMatrixStack.cpp
    ofSystemUtils.cpp
    ofThread.cpp
    ofTimer.cpp
    ofTimerFps.cpp
    ofURLFileLoader.cpp
    ofUtils.cpp
    ofXml.cpp
)
