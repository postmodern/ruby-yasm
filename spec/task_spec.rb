require 'yasm/task'

require 'spec_helper'

describe Task do
  it "should support a :target option" do
    task = Task.new(:target => :amd64)

    expect(task.arch).to eq(:x86)
    expect(task.machine).to eq(:amd64)
  end

  describe "target!" do
    it "should return true for valid targets" do
      task = Task.new

      expect(task.target!(:amd64)).to eq(true)
    end

    it "should raise ArgumentError when passed unknown targets" do
      task = Task.new

      expect {
        task.target! :lol
      }.to raise_error(ArgumentError)
    end

    describe "x86" do
      subject do
        Task.new { |task| task.target! :x86 }
      end

      it "should set the arch value" do
        expect(subject.arch).to eq(:x86)
      end

      it "should set the machine value" do
        expect(subject.machine).to eq(:x86)
      end
    end

    describe "amd64" do
      subject do
        Task.new { |task| task.target! :amd64 }
      end

      it "should set the arch value" do
        expect(subject.arch).to eq(:x86)
      end

      it "should set the machine value" do
        expect(subject.machine).to eq(:amd64)
      end
    end

    describe "lc3b" do
      subject do
        Task.new { |task| task.target! :lc3b }
      end

      it "should set the arch value" do
        expect(subject.arch).to eq(:lc3b)
      end

      it "should set the machine value" do
        expect(subject.machine).to eq(:lc3b)
      end
    end
  end
end
