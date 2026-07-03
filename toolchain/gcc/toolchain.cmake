#[[
  Copyright 2026 Quintauris GmbH
  Licensed under the Apache License, Version 2.0 (the "License").
  https://www.apache.org/licenses/LICENSE-2.0
]]

set(CMAKE_C_COMPILER_ID GNU)
set(CMAKE_C_STANDARD 17)

set(search_paths
    # Common macOS/Homebrew locations
    /opt/homebrew/opt/riscv-gnu-toolchain/bin
    # Most common location for a custom toolchain in POSIX systems
    /opt/riscv-gnu-toolchain/bin
    # Most common system-wide compiler locations in POSIX systems
    /usr/local/bin
    /usr/bin)

find_program(
  CMAKE_C_COMPILER
  NAMES riscv64-unknown-elf-gcc
  HINTS ${search_paths} REQUIRED
  NO_DEFAULT_PATH)

find_program(
  CMAKE_ASM_COMPILER
  NAMES riscv64-unknown-elf-gcc
  HINTS ${search_paths} REQUIRED
  NO_DEFAULT_PATH)

find_program(
  CMAKE_C_COMPILER_LINKER
  NAMES riscv64-unknown-elf-gcc
  HINTS ${search_paths} REQUIRED
  NO_DEFAULT_PATH)

find_program(
  CMAKE_AR
  NAMES riscv64-unknown-elf-gcc-ar
  HINTS ${search_paths} REQUIRED
  NO_DEFAULT_PATH)

find_program(
  CMAKE_RANLIB
  NAMES riscv64-unknown-elf-gcc-ranlib
  HINTS ${search_paths} REQUIRED
  NO_DEFAULT_PATH)

find_program(
  OBJCOPY
  NAMES riscv64-unknown-elf-objcopy
  HINTS ${search_paths} REQUIRED
  NO_DEFAULT_PATH)

set(CMAKE_ASM_COMPILER_ID ${CMAKE_C_COMPILER_ID})
set(CMAKE_ASM_COMPILER_LINKER ${CMAKE_C_COMPILER_LINKER})
set(CMAKE_LINKER ${CMAKE_C_COMPILER_LINKER})

add_compile_options(-Wall -Wextra -pedantic)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

install(FILES ${CMAKE_CURRENT_LIST_FILE} DESTINATION cmake/toolchain)
install(FILES ${CMAKE_CURRENT_LIST_DIR}/sections.ld DESTINATION linker/machine)
