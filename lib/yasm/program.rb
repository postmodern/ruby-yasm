require 'yasm/task'

require 'rprogram'
require 'tempfile'

module YASM
  class Program < RProgram::Program

    name_program 'yasm'

    def self.assmeble(options={},&block)
      self.find.assemble(options,&block)
    end

    def assemble(options={},&block)
      run_task(Task.new(options,&block)
    end

    def assemble_temp(options={},&block)
      task = Task.new(options,&block)
      task.output = TempFile.new('yasm')

      if run_task(task)
        return task.output
      end
    end

  end
end
