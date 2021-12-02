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
    # @yield [task]
    #   If a block is given, it will be passed a task object used to
    #   specify options for yasm.
    #
    # @yieldparam [Task] task
    #   The yasm task object.
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
    # @param [Hash{Symbol => Object}] exec_options
    #   Additional exec-options.
    #
    # @yield [task]
    #   If a block is given, it will be passed a task object used to
    #   specify options for yasm.
    #
    # @yieldparam [Task] task
    #   The yasm task object.
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
