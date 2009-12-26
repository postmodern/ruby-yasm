require 'yasm/program'

require 'spec_helper'
require 'helpers/files'

describe Program do
  include Helpers::Files

  before(:all) do
    @yasm = Program.find
  end

  it "should be able to assemble a file" do
    file = Tempfile.new('yasm').path

    @yasm.assemble do |yasm|
      yasm.gas!
      yasm.x86!

      yasm.file = assembly_file('gas')
      yasm.output_format = :bin
      yasm.output = file
    end

    File.size(file).should > 0
  end

  it "should assemble a file, and write the output to a temporary file" do
    file = @yasm.assemble_temp do |yasm|
      yasm.gas!
      yasm.x86!

      yasm.file = assembly_file('gas')
      yasm.output_format = :bin
    end

    file.should_not be_nil
    File.size(file).should > 0
  end
end
