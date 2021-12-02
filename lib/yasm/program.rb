require 'yasm/command'

module YASM
  #
  # @deprecated Please use {Command} instead.
  #
  class Program < Command

    #
    # Finds the `yasm` program and assembles a file.
    #
    # @param [Hash{Symbol => Object}] options
    #   Additional options for yasm.
    #
    # @yield [program]
    #   If a block is given, it will be passed a program object used to
    #   specify options for yasm.
    #
    # @yieldparam [Program] program
    #   The yasm program object.
    #
    # @return [Boolean]
    #   Specifies whether the command exited normally.
    #
    # @example
    #   Program.assemble(
    #     :parser => :gas,
    #     :output => 'code.o',
    #     :file   => 'code.S'
    #   )
    #
    # @example
    #   Program.assemble do |yasm|
    #     yasm.target! :x86
    #
    #     yasm.syntax = :gas
    #     yasm.file   = 'code.S'
    #     yasm.output = 'code.o'
    #   end
    #
    # @see #assemble
    #
    def self.assemble(options={},&block)
      new(options,&block).assemble()
    end

    #
    # Assembles an assembly file.
    #
    # @param [Hash{Symbol => Object}] options
    #   Additional options for yasm.
    #
    # @yield [program]
    #   If a block is given, it will be passed a program object used to
    #   specify options for yasm.
    #
    # @yieldparam [Program] program
    #   The yasm program object.
    #
    # @return [Boolean]
    #   Specifies whether the command exited normally.
    #
    # @example
    #   Program.assemble(
    #     :parser => :gas,
    #     :output => 'code.o',
    #     :file   => 'code.S'
    #   )
    #
    # @example
    #   Program.assemble do |yasm|
    #     yasm.target! :x86
    #
    #     yasm.syntax = :gas
    #     yasm.file   = 'code.S'
    #     yasm.output = 'code.o'
    #   end
    #
    def assemble(options={})
      options.each do |name,value|
        self[name] = value
      end

      yield self if block_given?

      run_command()
    end

    #
    # @deprecated Please use {#target=} instead.
    #
    def target!(name)
      self.target = name
      return true
    end

  end
end
