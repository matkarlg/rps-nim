# Package

version       = "0.1.0"
author        = "Mathias Karlgren"
description   = "Rock, paper and scissors game in nim"
license       = "MIT"
srcDir        = "src"
bin           = @["rps_nim"]
skipExt       = @["nim"]

# Dependencies

requires "nim >= 0.20.0"
requires "gara >= 0.2.0"

# Cmds

task run, "Run project":
  exec "nim c --verbosity:0 -r src/rps_nim"

task release, "Build static project":
  exec "nim --gcc.exe:musl-gcc --gcc.linkerexe:musl-gcc --passL:-static --passc:-flto -d:release --opt:size c src/rps_nim"
  exec "strip src/rps_nim"

task release_dyn, "Build project":
  exec "nim -d:release --passc:-flto --opt:size c src/rps_nim"
  exec "strip src/rps_nim"
