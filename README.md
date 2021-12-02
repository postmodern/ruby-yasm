# ruby-yasm

* [Source](https://github.com/sophsec/ruby-yasm/)
* [Issues](https://github.com/sophsec/ruby-yasm/issues)
* [Documentation](https://rubydoc.info/gems/ruby-yasm)

## Description

A Ruby interface to [YASM][yasm].

YASM is a complete rewrite of the NASM assembler, YASM currently supports
the x86 and AMD64 instruction sets, accepts NASM and GAS assembler syntaxes,
outputs binary, ELF32, ELF64, 32 and 64-bit Mach-O, RDOFF2, COFF, Win32,
and Win64 object formats, and generates source debugging information in
STABS, DWARF 2, and CodeView 8 formats.

## Features

* Supports all of the `yasm` command-line options.

## Examples

Assemble a binary file:

```ruby
YASM::Command.run(syntax: :gas, file: 'hello_world.S', output: 'hello_world.o')
```

Assemble amd64 assembly, in GAS syntax, into an ELF64 file with
debugging information:

```ruby
YASM::Command.run do |yasm|
  yasm.target = :amd64

  yasm.syntax = :gas
  yasm.file   = 'hello_world.S'

  yasm.output        = 'hello_world.o'
  yasm.output_format = :elf64
  yasm.debug_format  = :stabs
end
```

## Requirements

* [yasm] >= 0.8.0
* [command_mapper](https://github.com/postmodern/command_mapper.rb#readme) ~> 0.1

## Install

```shell
$ sudo gem install ruby-yasm
```

### yasm

* Debian / Ubuntu:

```shell
$ sudo apt install yasm
```

* RedHat / Fedora:

```shell
$ sudo dnf install yasm
```

* Homebrew:

```shell
$ brew install yasm
```

## License

Copyright (c) 2009-2021 Hal Brodigan

See {file:LICENSE.txt} for license information.

[yasm]: https://www.tortall.net/projects/yasm/
