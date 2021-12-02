require 'spec_helper'
require 'helpers/files'

require 'yasm/program'
require 'tempfile'

describe YASM::Program do
  include Helpers::Files

  describe ".assemble" do
    subject { described_class }

    it "should be able to assemble a file" do
      file = Tempfile.new('yasm').path

      subject.assemble do |yasm|
        yasm.target! :x86

        yasm.syntax = :gas
        yasm.file = assembly_file('gas')
        yasm.output = file
      end

      expect(File.size(file)).to be > 0
    end
  end

  describe "#assemble" do
    it "should be able to assemble a file" do
      file = Tempfile.new('yasm').path

      subject.assemble do |yasm|
        yasm.target! :x86

        yasm.syntax = :gas
        yasm.file = assembly_file('gas')
        yasm.output = file
      end

      expect(File.size(file)).to be > 0
    end
  end

  describe "#initialize" do
    subject { described_class.new(target: :amd64) }

    it "should support a :target option" do
      expect(subject.arch).to eq(:x86)
      expect(subject.machine).to eq(:amd64)
    end
  end

  describe "#target!" do
    it "should return true for valid targets" do
      expect(subject.target!(:amd64)).to be(true)
    end

    context "when given an unknown target name" do
      let(:name) { :lol }

      it "should raise ArgumentError when passed unknown targets" do
        expect {
          subject.target!(name)
        }.to raise_error(ArgumentError,"unknown YASM target: #{name.inspect}")
      end
    end

    context "when given :x86" do
      before { subject.target!(:x86) }

      it "should set the #arch value" do
        expect(subject.arch).to eq(:x86)
      end

      it "should set the #machine value" do
        expect(subject.machine).to eq(:x86)
      end
    end

    context "when given :amd64" do
      before { subject.target!(:amd64) }

      it "should set the #arch value" do
        expect(subject.arch).to eq(:x86)
      end

      it "should set the #machine value" do
        expect(subject.machine).to eq(:amd64)
      end
    end

    context "when given :lc3b" do
      before { subject.target!(:lc3b) }

      it "should set the #arch value" do
        expect(subject.arch).to eq(:lc3b)
      end

      it "should set the #machine value" do
        expect(subject.machine).to eq(:lc3b)
      end
    end
  end
end
