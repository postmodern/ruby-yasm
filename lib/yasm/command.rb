require 'command_mapper/command'

module YASM
  #
  # Provides an interface for invoking the `yasm` utility.
  #
  # ## Examples
  #
  # Assemble a binary file:
  #
  #     YASM::Command.run(syntax: :gas, file: 'hello_world.S', output: 'hello_world.o')
  #
  # Assemble amd64 assembly, in GAS syntax, into an ELF64 file with
  # debugging information:
  #
  #     YASM::Command.run do |yasm|
  #       yasm.target = :amd64
  #     
  #       yasm.syntax = :gas
  #       yasm.file   = 'hello_world.S'
  #
  #       yasm.output        = 'hello_world.o'
  #       yasm.output_format = :elf64
  #       yasm.debug_format  = :stabs
  #     end
  #
  # ## `yasm` options:
  #
  # * `--version` -  `yasm.version`
  # * `--license` -  `yasm.license`
  # * `--help` -  `yasm.help`
  # * `--arch` -  `yasm.arch`
  #   * `x86` - x86 (IA-32 and derivatives), AMD64
  #   * `lc3b` - LC-3b
  # * `--parser` -  `yasm.parser`
  #   * `gas` - GNU AS (GAS)-compatible parser
  #   * `gnu` - GNU AS (GAS)-compatible parser
  #   * `nasm` - NASM-compatible parser
  #   * `tasm` - TASM-compatible parser
  # * `--preproc` -  `yasm.preprocessor`
  #   * `nasm` - Real NASM Preprocessor
  #   * `tasm` - Real TASM Preprocessor
  #   * `raw` - Disable preprocessing
  #   * `cpp` - Run input through external C preprocessor
  #   * `gas` - GNU AS (GAS)-compatible preprocessor
  # * `--oformat` -  `yasm.output_format`
  #   * `dbg` - Trace of all info passed to object format module
  #   * `bin` - Flat format binary
  #   * `dosexe` - DOS .EXE format binary
  #   * `elf` - ELF
  #   * `elf32` - ELF (32-bit)
  #   * `elf64` - ELF (64-bit)
  #   * `elfx32` - ELF (x32)
  #   * `coff` - COFF (DJGPP)
  #   * `macho` - Mac OS X ABI Mach-O File Format
  #   * `macho32` - Mac OS X ABI Mach-O File Format (32-bit)
  #   * `macho64` - Mac OS X ABI Mach-O File Format (64-bit)
  #   * `rdf` - Relocatable Dynamic Object File Format (RDOFF) v2.0
  #   * `win32` - Win32
  #   * `win64` - Win64
  #   * `x64` - Win64
  #   * `xdf` - Extended Dynamic Object
  # * `--dformat` -  `yasm.debug_format`
  #   * `cv8` - CodeView debugging format for VC8
  #   * `dwarf2` - DWARF2 debugging format
  #   * `null` - No debugging info
  #   * `stabs` - Stabs debugging format
  # * `--lformat` -  `yasm.list_format`
  #   * `nasm` -NASM-style list format 
  # * `--list` -  `yasm.list_file`
  # * `--objfile` -  `yasm.output`
  # * `--mapfile` -  `yasm.map_file`
  # * `--machine` -  `yasm.machine`
  #   * `x86` - IA-32 and derivatives
  #   * `amd64` - AMD64
  #   * `x32` - X32
  # * `--force-strict` -  `yasm.force_strict`
  # * `-w` -  `yasm.inhibit_warnings`
  # * `-W` -  `yasm.toggle_warnings`
  # * `-M` -  `yasm.gen_makefile_deps`
  # * `-E` -  `yasm.redirect_errors_to`
  # * `-e` -  `yasm.redirect_errors`
  # * `--preproc-only` -  `yasm.preprocessor_only`
  # * `-I` -  `yasm.include`
  # * `-P` -  `yasm.pre_include`
  # * `-D` -  `yasm.define`
  # * `-U` -  `yasm.undefine`
  # * `-X` -  `yasm.message_style`
  #   * `gnu`
  #   * `vc`
  # * `--prefix` -  `yasm.prefix`
  # * `--suffix` -  `yasm.suffix`
  # * `file` -  `yasm.file`
  #
  # @since 0.3.0
  #
  class Command < CommandMapper::Command

    command 'yasm' do
      option '--version'
      option '--license'
      option '--help'

      option '--arch', equals: true,
                       value: {
                         type: Enum[
                                 :x86, # x86 (IA-32 and derivatives), AMD64
                                 :lc3b # LC-3b
                               ]
                       }

      option '--parser', equals: true,
                         value: {
                           type: Enum[
                                   :gas,  # GNU AS (GAS)-compatible parser
                                   :gnu,  # GNU AS (GAS)-compatible parser
                                   :nasm, # NASM-compatible parser
                                   :tasm  # TASM-compatible parser
                                 ]
                         }

      option '--preproc', equals: true,
                          value: {
                            type: Enum[
                                    :nasm, # Real NASM Preprocessor
                                    :tasm, # Real TASM Preprocessor
                                    :raw,  # Disable preprocessing
                                    :cpp,  # Run input through external C preprocessor
                                    :gas   # GNU AS (GAS)-compatible preprocessor
                                  ]
                          },
                          name: :preprocessor
      option '--oformat', equals: true,
                          value: {
                            type: Enum[
                                    :dbg, # Trace of all info passed to object format module
                                    :bin, # Flat format binary
                                    :dosexe, # DOS .EXE format binary
                                    :elf, # ELF
                                    :elf32, # ELF (32-bit)
                                    :elf64, # ELF (64-bit)
                                    :elfx32, # ELF (x32)
                                    :coff, # COFF (DJGPP)
                                    :macho, # Mac OS X ABI Mach-O File Format
                                    :macho32, # Mac OS X ABI Mach-O File Format (32-bit)
                                    :macho64, # Mac OS X ABI Mach-O File Format (64-bit)
                                    :rdf, # Relocatable Dynamic Object File Format (RDOFF) v2.0
                                    :win32, # Win32
                                    :win64, # Win64
                                    :x64, # Win64
                                    :xdf  # Extended Dynamic Object
                                  ]
                          },
                          name: :output_format
      option '--dformat', equals: true,
                          value: {
                            type: Enum[
                                    :cv8,    # CodeView debugging format for VC8
                                    :dwarf2, # DWARF2 debugging format
                                    :null,   # No debugging info
                                    :stabs   # Stabs debugging format
                                  ]
                          },
                          name: :debug_format
      option '--lformat', equals: true,
                          value: {
                            type: Enum[
                                    :nasm # NASM-style list format
                                  ]
                          },
                          name: :list_format

      option '--list', equals: true,
                       value:  true,
                       name:   :list_file

      option '--objfile', equals: true,
                          value:  true,
                          name:   :output

      option '--mapfile', equals: true,
                          value:  true,
                          name:   :map_file

      option  '--machine', equals: true,
                           value: {
                             type: Enum[
                                     :x86,   # IA-32 and derivatives
                                     :amd64, # AMD64
                                     :x32    # X32
                                   ]
                           }

      option  '--force-strict'
      option '-w', name: :inhibit_warnings
      option '-W', name: :toggle_warnings
      option '-M', name: :gen_makefile_deps
      option '-E', value: true, name: :redirect_errors_to
      option '-s', name: :redirect_errors
      option  '--preproc-only', name: :preprocessor_only

      option '-I', value:   {type: InputDir.new},
                   repeats: true,
                   name:    :include

      option '-P', value: {type: InputFile.new},
                   repeats: true,
                   name: :pre_include

      option '-D', name: :define, repeats: true

      option '-U', value: true,
                   repeats: true,
                   name: :undefine

      option '-X', value: {type: Enum[:gnu, :vc]},
                   name:  :message_style

      option  '--prefix'
      option  '--suffix'

      argument :file, type: InputFile.new
    end

    # The known YASM targets
    TARGETS = {
      x86:   {arch: :x86,  machine: :x86},
      amd64: {arch: :x86,  machine: :amd64},
      lc3b:  {arch: :lc3b, machine: :lc3b}
    }

    #
    # Determines which target was set.
    #
    # @return [:x86, :amd64, :lc3b, nil]
    #   The target name or `nil` if no target has been set.
    #
    def target
      if arch && machine
        TARGETS.key(arch: arch.to_sym, machine: machine.to_sym)
      end
    end

    #
    # Sets that target.
    #
    # @param [:x86, :amd64, :lc3b] name
    #   The target name.
    #
    # @return [Symbol]
    #   The set target.
    #
    # @raise [ArgumentError]
    #   An unknown target name was given.
    #
    def target=(name)
      target = TARGETS.fetch(name.to_sym) do
        raise(ArgumentError,"unknown YASM target: #{name.inspect}")
      end

      self.arch    = target[:arch]
      self.machine = target[:machine]
      return name
    end

    alias syntax parser
    alias syntax= parser=

  end
end
