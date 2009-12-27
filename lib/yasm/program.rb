require 'yasm/task'

require 'rprogram'
require 'tempfile'

module YASM
  class Program < RProgram::Program

    name_program 'yasm'

    #
    # Finds the +yasm+ program and assembles a file.
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
    def self.assmeble(options={},&block)
      self.find().assemble(options,&block)
    end

    #
    # Finds the +yasm+ program, then assembles an assembly file and writes
    # the output to a temporary file.
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
    # @return [TempFile]
    #   The temporary file containing the assembled object code.
    #
    def self.assemble_temp(options={},&block)
      self.find().assemble(options,&block)
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
    def assemble(options={},&block)
      run_task(Task.new(options,&block))
    end

    #
    # Assembles an assembly file and writes the output to a temporary file.
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
    # @return [TempFile]
    #   The temporary file containing the assembled object code.
    #
    def assemble_temp(options={},&block)
      task = Task.new(options,&block)
      task.output = Tempfile.new('yasm').path

      if run_task(task)
        return task.output
      end
    end

  end
end
