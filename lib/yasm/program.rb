require 'yasm/task'

require 'rprogram'
require 'tempfile'

module YASM
  class Program < RProgram::Program

    name_program 'yasm'

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
    #   Program.assemble(:parser => :gas, :output => 'code.o', :file => 'code.S')
    #
    # @example
    #   Program.assemble do |yasm|
    #     yasm.target! :x86
    #
    #     yasm.syntax = :gas
    #     yasm.file = 'code.S'
    #     yasm.output = 'code.o'
    #   end
    #
    def Program.assemble(options={},&block)
      Program.find().assemble(options,&block)
    end

    #
    # Assembles an assembly file.
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
    #   Program.assemble(:parser => :gas, :output => 'code.o', :file => 'code.S')
    #
    # @example
    #   Program.assemble do |yasm|
    #     yasm.target! :x86
    #
    #     yasm.syntax = :gas
    #     yasm.file = 'code.S'
    #     yasm.output = 'code.o'
    #   end
    #
    def assemble(options={},&block)
      run_task(Task.new(options,&block))
    end

  end
end
