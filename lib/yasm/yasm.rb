module YASM
  def YASM.parser
    @@yasm_parser ||= :gas
  end

  def YASM.parser=(new_parser)
    @@yasm_parser = new_parser.to_sym
  end

  def YASM.arch
    @@yasm_arch
  end

  def YASM.arch=(new_arch)
    @@yasm_arch = new_arch.to_sym
  end

  def YASM.machine
    @@yasm_machine
  end

  def YASM.machine=(new_machine)
    @@yasm_machine = new_machine.to_sym
  end

  def YASM.debug_format
    @@yasm_debug_format
  end

  def YASM.debug_format=(new_format)
    @@yasm_debug_format = new_format.to_sym
  end

  def YASM.output_format
    @@yasm_output_format ||= :bin
  end

  def YASM.output_format=(new_format)
    @@yasm_output_format = new_format.to_sym
  end
end
