if(NOT OF_BUILD_SINGLE_LIB)

set(target sound)
add_library(${target})

find_package(glm CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE glm::glm)
# find_package(unofficial-libtess2 CONFIG REQUIRED)
# target_link_libraries(${target} PRIVATE unofficial::libtess2::libtess2)
find_package(utf8cpp CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE utf8::cpp utf8cpp::utf8cpp)
# Using distinct targets
find_package(kissfft CONFIG REQUIRED)
target_link_libraries(${target} PRIVATE kissfft::kissfft-float)
# Alternative targets: kissfft::kissfft-double, kissfft::int16_t, kissfft::int32_t

# Using a distinct package component
# find_package(kissfft CONFIG REQUIRED COMPONENTS float)
# target_link_libraries(${target} PRIVATE kissfft::kissfft)
# Alternative components: double, int16_t, int32_t
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

target_include_directories(${target} PRIVATE
    # ${openFrameworks_SOURCE_DIR}/3d
    ${openFrameworks_SOURCE_DIR}/app
    ${openFrameworks_SOURCE_DIR}/events
    # ${openFrameworks_SOURCE_DIR}/gl
    # ${openFrameworks_SOURCE_DIR}/graphics
    ${openFrameworks_SOURCE_DIR}/math
    ${openFrameworks_SOURCE_DIR}/sound
    ${openFrameworks_SOURCE_DIR}/types
    ${openFrameworks_SOURCE_DIR}/utils
)
endif(NOT OF_BUILD_SINGLE_LIB)

target_sources(${target} PRIVATE
    ofFmodSoundPlayer.cpp
    # ofMediaFoundationSoundPlayer.cpp
    ofOpenALSoundPlayer.cpp
    ofRtAudioSoundStream.cpp
    ofSoundBaseTypes.cpp
    ofSoundBuffer.cpp
    ofSoundPlayer.cpp
    ofSoundStream.cpp
)
