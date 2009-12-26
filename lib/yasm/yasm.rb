module YASM
  @@yasm_parser = :gas
  @@yasm_arch = nil
  @@yasm_machine = nil
  @@yasm_debug_format = nil
  @@yasm_output_format = :bin

  #
  # The default YASM parser to use.
  #
  # @return [Symbol]
  #   The YASM parser.
  #
  def YASM.parser
    @@yasm_parser
  end

  #
  # Sets the default YASM parser to use.
  #
  # @param [Symbol, String] new_parser
  #   The new YASM parser to use.
  #
  # @return [Symbol]
  #   The new YASM parser to use.
  #
  def YASM.parser=(new_parser)
    @@yasm_parser = if new_parser.nil?
                      nil
                    else
                      new_parser.to_sym
                    end
  end

  #
  # The default YASM architecture to assemble for.
  #
  # @return [Symbol]
  #   The YASM architecture.
  #
  def YASM.arch
    @@yasm_arch
  end

  #
  # Sets the default YASM architecture to assemble for.
  #
  # @param [Symbol, String] new_arch
  #   The new YASM architecture to assemble for.
  #
  # @return [Symbol]
  #   The new YASM architecture to assemble for.
  #
  def YASM.arch=(new_arch)
    if new_arch.nil?
      @@yasm_arch = nil
    else
      @@yasm_arch = new_arch.to_sym
    end
  end

  #
  # The default YASM machine to assemble for.
  #
  # @return [Symbol]
  #   The YASM machine.
  #
  def YASM.machine
    @@yasm_machine ||= nil
  end

  #
  # Sets the default YASM machine to assemble for.
  #
  # @param [Symbol, String] new_machine
  #   The new YASM machine to assemble for.
  #
  # @return [Symbol]
  #   The new YASM machine to assemble for.
  #
  def YASM.machine=(new_machine)
    @@yasm_machine = if new_machine.nil?
                       nil
                     else
                       new_machine.to_sym
                     end
  end

  #
  # The default YASM debugging format to use.
  #
  # @return [Symbol]
  #   The YASM debugging format.
  #
  def YASM.debug_format
    @@yasm_debug_format
  end

  #
  # Sets the default YASM debugging format to use.
  #
  # @param [Symbol, String] new_format
  #   The new YASM debugging format to use.
  #
  # @return [Symbol]
  #   The new YASM debugging format to use.
  #
  def YASM.debug_format=(new_format)
    @@yasm_debug_format = if new_format.nil?
                            nil
                          else
                            new_format.to_sym
                          end
  end

  #
  # The default YASM output format to use.
  #
  # @return [Symbol]
  #   The YASM output format.
  #
  def YASM.output_format
    @@yasm_output_format
  end

  #
  # Sets the default YASM output format to use.
  #
  # @param [Symbol, String] new_format
  #   The new YASM output format to use.
  #
  # @return [Symbol]
  #   The new YASM output format to use.
  #
  def YASM.output_format=(new_format)
    @@yasm_output_format = if new_format.nil?
                             nil
                           else
                             new_format.to_sym
                           end
  end
end
