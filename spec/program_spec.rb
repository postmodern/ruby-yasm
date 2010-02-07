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
      yasm.target! :x86

      yasm.syntax = :gas
      yasm.file = assembly_file('gas')
      yasm.output = file
    end

    File.size(file).should > 0
  end
end
