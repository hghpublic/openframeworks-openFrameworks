cmake_minimum_required(VERSION 3.31.10)

project(openFrameworks VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED True)

if(OF_BUILD_SINGLE_LIB)
set(target openFrameworks)
add_library(${target} STATIC)

find_package(glfw3 CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE glfw)

find_package(glm CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE glm::glm)

find_package(unofficial-libtess2 CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE unofficial::libtess2::libtess2)

find_package(utf8cpp CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE utf8::cpp utf8cpp::utf8cpp)

find_package(PkgConfig REQUIRED)
pkg_search_module(GSTREAMER REQUIRED IMPORTED_TARGET gstreamer-1.0)
target_link_libraries(${target} PRIVATE PkgConfig::GSTREAMER)
pkg_search_module(GSTREAMER_VIDEO REQUIRED IMPORTED_TARGET gstreamer-video-1.0)
target_link_libraries(${target} PRIVATE PkgConfig::GSTREAMER_VIDEO)
pkg_search_module(GSTREAMER_APP REQUIRED IMPORTED_TARGET gstreamer-app-1.0)
target_link_libraries(${target} PRIVATE PkgConfig::GSTREAMER_APP)
# pkg_search_module(GSTREAMER_FULL REQUIRED IMPORTED_TARGET gstreamer-full-1.0)
# target_link_libraries(${target} PRIVATE PkgConfig::GSTREAMER_FULL)

find_package(Freetype REQUIRED)
target_link_libraries(${target} PRIVATE Freetype::Freetype)

find_package(kissfft CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE kissfft::kissfft-float)

find_package(GLEW REQUIRED)
target_link_libraries(${target} PRIVATE GLEW::GLEW)

find_package(OpenAL CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE OpenAL::OpenAL)

find_package(RtAudio CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE RtAudio::rtaudio)

find_package(freeimage CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE freeimage::FreeImage freeimage::FreeImagePlus)

find_package(uriparser CONFIG REQUIRED char wchar_t)
target_link_libraries(${target} PRIVATE uriparser::uriparser)

find_package(pugixml CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE pugixml::static pugixml::pugixml)

find_package(curl)
target_link_libraries(${target} PRIVATE curl)

find_package(openssl)
target_link_libraries(${target} PRIVATE ssl crypto)

find_package(udev)
target_link_libraries(${target} PRIVATE udev)

find_package(sndfile)
target_link_libraries(${target} PRIVATE sndfile)

find_package(fontconfig)
target_link_libraries(${target} PRIVATE fontconfig)

find_package(OpenGL REQUIRED)
target_link_libraries(${target} PRIVATE OpenGL::GL OpenGL::GLU OpenGL::EGL)

target_include_directories(${target} PUBLIC
    ${openFrameworks_SOURCE_DIR}
    ${openFrameworks_SOURCE_DIR}/3d
    ${openFrameworks_SOURCE_DIR}/app
    ${openFrameworks_SOURCE_DIR}/communication
    ${openFrameworks_SOURCE_DIR}/events
    ${openFrameworks_SOURCE_DIR}/gl
    ${openFrameworks_SOURCE_DIR}/graphics
    ${openFrameworks_SOURCE_DIR}/math
    ${openFrameworks_SOURCE_DIR}/sound
    ${openFrameworks_SOURCE_DIR}/types
    ${openFrameworks_SOURCE_DIR}/utils
    ${openFrameworks_SOURCE_DIR}/video
)
endif(OF_BUILD_SINGLE_LIB)

add_subdirectory(3d)
add_subdirectory(app)
add_subdirectory(communication)
add_subdirectory(events)
add_subdirectory(gl)
add_subdirectory(graphics)
add_subdirectory(math)
add_subdirectory(sound)
add_subdirectory(types)
add_subdirectory(utils)
add_subdirectory(video)
