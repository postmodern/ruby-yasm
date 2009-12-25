require 'yasm/task'

require 'rprogram'

module YASM
  class Program < RProgram::Program

    name_program 'yasm'

    def self.assmeble(options={},&block)
      self.find.assemble(options,&block)
    end

    def assemble(options={},&block)
      run_task(Task.new(options,&block)
    end

  end
end
