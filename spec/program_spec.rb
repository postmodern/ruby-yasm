require 'spec_helper'
require 'helpers/files'

require 'yasm/program'
require 'tempfile'

describe Program do
  include Helpers::Files

  subject { described_class.find }

  it "should be able to assemble a file" do
    file = Tempfile.new('yasm').path

    subject.assemble do |yasm|
      yasm.target! :x86

      yasm.syntax = :gas
      yasm.file = assembly_file('gas')
      yasm.output = file
    end

    File.size(file).should > 0
  end
end
