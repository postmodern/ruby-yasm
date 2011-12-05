require 'yasm/task'

require 'rprogram'

module YASM
  class Program < RProgram::Program

    name_program 'yasm'

    #
    # Finds the `yasm` program and assembles a file.
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
    # @see #assemble
    #
    def self.assemble(options={},exec_options={},&block)
      find.assemble(options,exec_options,&block)
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
    # @see http://rubydoc.info/gems/rprogram/0.3.0/RProgram/Program#run-instance_method
    #   For additional exec-options.
    #
    def assemble(options={},exec_options={},&block)
      run_task(Task.new(options,&block),exec_options)
    end

  end
end
