# Install script for directory: C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/pkgs/pcre2_x64-windows")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "OFF")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-8.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-8.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-posix.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-posix.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-16.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-16.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-32.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-32.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/pcre2/pcre2-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/pcre2/pcre2-targets.cmake"
         "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/CMakeFiles/Export/88002308932b1f0bea237d7547cb2585/pcre2-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/pcre2/pcre2-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/pcre2/pcre2-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/pcre2" TYPE FILE FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/CMakeFiles/Export/88002308932b1f0bea237d7547cb2585/pcre2-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/pcre2" TYPE FILE FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/CMakeFiles/Export/88002308932b1f0bea237d7547cb2585/pcre2-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/libpcre2-posix.pc"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/libpcre2-8.pc"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/libpcre2-16.pc"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/libpcre2-32.pc"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-config")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2.h"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/src/pcre2posix.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/pcre2" TYPE FILE FILES
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/cmake/pcre2-config.cmake"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/cmake/pcre2-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2-config.1"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2grep.1"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2test.1"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man3" TYPE FILE FILES
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_callout_enumerate.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_code_copy.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_code_copy_with_tables.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_code_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_compile.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_compile_context_copy.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_compile_context_create.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_compile_context_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_config.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_convert_context_copy.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_convert_context_create.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_convert_context_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_converted_pattern_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_dfa_match.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_general_context_copy.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_general_context_create.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_general_context_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_get_error_message.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_get_mark.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_get_match_data_heapframes_size.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_get_match_data_size.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_get_ovector_count.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_get_ovector_pointer.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_get_startchar.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_jit_compile.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_jit_free_unused_memory.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_jit_match.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_jit_stack_assign.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_jit_stack_create.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_jit_stack_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_maketables.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_maketables_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_match.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_match_context_copy.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_match_context_create.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_match_context_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_match_data_create.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_match_data_create_from_pattern.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_match_data_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_pattern_convert.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_pattern_info.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_serialize_decode.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_serialize_encode.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_serialize_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_serialize_get_number_of_codes.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_bsr.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_callout.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_character_tables.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_compile_extra_options.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_compile_recursion_guard.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_depth_limit.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_glob_escape.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_glob_separator.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_heap_limit.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_match_limit.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_max_pattern_compiled_length.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_max_pattern_length.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_max_varlookbehind.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_newline.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_offset_limit.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_optimize.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_parens_nest_limit.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_recursion_limit.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_recursion_memory_management.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_substitute_callout.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_set_substitute_case_callout.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substitute.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_copy_byname.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_copy_bynumber.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_get_byname.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_get_bynumber.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_length_byname.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_length_bynumber.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_list_free.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_list_get.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_nametable_scan.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2_substring_number_from_name.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2api.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2build.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2callout.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2compat.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2convert.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2demo.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2jit.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2limits.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2matching.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2partial.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2pattern.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2perform.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2posix.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2sample.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2serialize.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2syntax.3"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2unicode.3"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/pcre2" TYPE FILE FILES
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/AUTHORS.md"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/COPYING"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/ChangeLog"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/LICENCE.md"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/NEWS"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/README"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/SECURITY.md"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2-config.txt"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2.txt"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2grep.txt"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/pcre2test.txt"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/pcre2/html" TYPE FILE FILES
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/NON-AUTOTOOLS-BUILD.txt"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/README.txt"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/index.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2-config.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_callout_enumerate.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_code_copy.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_code_copy_with_tables.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_code_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_compile.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_compile_context_copy.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_compile_context_create.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_compile_context_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_config.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_convert_context_copy.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_convert_context_create.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_convert_context_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_converted_pattern_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_dfa_match.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_general_context_copy.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_general_context_create.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_general_context_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_get_error_message.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_get_mark.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_get_match_data_heapframes_size.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_get_match_data_size.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_get_ovector_count.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_get_ovector_pointer.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_get_startchar.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_jit_compile.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_jit_free_unused_memory.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_jit_match.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_jit_stack_assign.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_jit_stack_create.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_jit_stack_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_maketables.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_maketables_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_match.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_match_context_copy.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_match_context_create.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_match_context_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_match_data_create.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_match_data_create_from_pattern.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_match_data_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_pattern_convert.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_pattern_info.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_serialize_decode.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_serialize_encode.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_serialize_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_serialize_get_number_of_codes.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_bsr.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_callout.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_character_tables.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_compile_extra_options.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_compile_recursion_guard.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_depth_limit.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_glob_escape.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_glob_separator.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_heap_limit.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_match_limit.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_max_pattern_compiled_length.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_max_pattern_length.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_max_varlookbehind.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_newline.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_offset_limit.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_optimize.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_parens_nest_limit.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_recursion_limit.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_recursion_memory_management.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_substitute_callout.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_set_substitute_case_callout.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substitute.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_copy_byname.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_copy_bynumber.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_get_byname.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_get_bynumber.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_length_byname.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_length_bynumber.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_list_free.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_list_get.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_nametable_scan.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2_substring_number_from_name.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2api.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2build.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2callout.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2compat.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2convert.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2demo.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2grep.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2jit.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2limits.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2matching.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2partial.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2pattern.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2perform.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2posix.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2sample.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2serialize.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2syntax.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2test.html"
    "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/src/cre2-10.46-1e90546362.clean/doc/html/pcre2unicode.html"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-32.pdb"
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-16.pdb"
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-posix.pdb"
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-8.pdb"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-32d.pdb"
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-16d.pdb"
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-posixd.pdb"
      "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/pcre2-8d.pdb"
      )
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/Bodya/source/repos/lxl-skibidi/vcpkg_installed/x64-windows/vcpkg/blds/pcre2/x64-windows-rel/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
