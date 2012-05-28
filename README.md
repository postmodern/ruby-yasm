# ruby-yasm

* [Source](https://github.com/sophsec/ruby-yasm/)
* [Issues](https://github.com/sophsec/ruby-yasm/issues)
* [Email](mailto:postmodern.mod3 at gmail.com)
* [www.tortall.net/projects/yasm](http://www.tortall.net/projects/yasm/)
* [www.sophsec.com](http://www.sophsec.com/)

## Description

A Ruby interface to YASM.

YASM is a complete rewrite of the NASM assembler, YASM currently supports
the x86 and AMD64 instruction sets, accepts NASM and GAS assembler syntaxes,
outputs binary, ELF32, ELF64, 32 and 64-bit Mach-O, RDOFF2, COFF, Win32,
and Win64 object formats, and generates source debugging information in
STABS, DWARF 2, and CodeView 8 formats.

## Features

* Supports all of the `yasm` command-line options.

## Examples

Assemble a binary file:

    YASM::Program.assemble do |yasm|
      yasm.syntax = :gas
      yasm.file   = 'hello_world.S'
      yasm.output = 'hello_world.o'
    end

Assemble amd64 assembly, in GAS syntax, into an ELF64 file with
debugging information:

    YASM::Program.assemble do |yasm|
      yasm.target! :amd64

      yasm.syntax = :gas
      yasm.file   = 'hello_world.S'

      yasm.output        = 'hello_world.o'
      yasm.output_format = :elf64
      yasm.debug_format  = :stabs
    end

## Requirements

* [yasm](http://www.tortall.net/projects/yasm/) >= 0.8.0
* [rprogram](http://rprogram.rubyforge.org/) ~> 0.3

## Install

    $ sudo gem install ruby-yasm

## License

Copyright (c) 2009-2011 Hal Brodigan

See {file:LICENSE.txt} for license information.
