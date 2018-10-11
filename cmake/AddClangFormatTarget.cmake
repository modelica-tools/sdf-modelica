# Copyright (C) 2018 Fondazione Istituto Italiano di Tecnologia
#
# Licensed under either the GNU Lesser General Public License v3.0 :
# https://www.gnu.org/licenses/lgpl-3.0.html
# or the GNU Lesser General Public License v2.1 :
# https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
# at your option.

# Targets to run and check source code with clang-format
# Inspired from https://gitlab.cern.ch/unige-fei4tel/proteus/commit/8d906a45801c03832531e243f41f5f5a83177de0

# Adding clang-format check and formatter if found
find_program(CLANG_FORMAT "clang-format")
if(CLANG_FORMAT)
  file(GLOB_RECURSE
       CHECK_CXX_SOURCE_FILES
       ${PROJECT_SOURCE_DIR}/*.h
       ${PROJECT_SOURCE_DIR}/*.cpp
       ${PROJECT_SOURCE_DIR}/*.hh
       ${PROJECT_SOURCE_DIR}/*.cc)
  add_custom_target(
      clang-format
      COMMAND
      ${CLANG_FORMAT}
      -i
      -style=file
      ${CHECK_CXX_SOURCE_FILES}
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src
      COMMENT "Auto formatting of all source files using clang-format"
  )
endif()
