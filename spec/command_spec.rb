require 'spec_helper'
require 'helpers/files'

require 'yasm/command'
require 'tempfile'

describe YASM::Command do
  include Helpers::Files

  describe ".run" do
    subject { described_class }

    it "should be able to assemble a file" do
      file = Tempfile.new('yasm').path

      subject.run do |yasm|
        yasm.target = :x86
        yasm.syntax = :gas
        yasm.file = assembly_file('gas')
        yasm.output = file
      end

      expect(File.size(file)).to be > 0
    end
  end

  describe "#target" do
    context "when no target has been set" do
      it "must return nil" do
        expect(subject.target).to be(nil)
      end
    end

    context "when the target has been set to :x86" do
      before { subject.target = :x86 }

      it "must return :x86" do
        expect(subject.target).to eq(:x86)
      end
    end

    context "when #arch is :x86 and #machine is :x86" do
      before do
        subject.arch    = :x86
        subject.machine = :x86
      end

      it "must return :x86" do
        expect(subject.target).to eq(:x86)
      end
    end

    context "when the target has been set to :amd64" do
      before { subject.target = :amd64}

      it "must return :amd64" do
        expect(subject.target).to eq(:amd64)
      end
    end

    context "when #arch is :x86 and #machine is :amd64" do
      before do
        subject.arch    = :x86
        subject.machine = :amd64
      end

      it "must return :amd64" do
        expect(subject.target).to eq(:amd64)
      end
    end

    context "when the target has been set to :lc3b" do
      before { subject.target = :lc3b}

      it "must return :lc3b" do
        expect(subject.target).to eq(:lc3b)
      end
    end

    context "when #arch is :lc3b and #machine is :lc3b" do
      before do
        subject.arch    = :lc3b
        subject.machine = :lc3b
      end

      it "must return :lc3b" do
        expect(subject.target).to eq(:lc3b)
      end
    end
  end
end
