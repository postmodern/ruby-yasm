require 'yasm/task'

require 'spec_helper'

describe Task do
  it "should support a :target option" do
    task = Task.new(:target => :amd64)

    task.arch.should == :x86
    task.machine.should == :amd64
  end

  describe "target!" do
    it "should return true for valid targets" do
      task = Task.new

      task.target!(:amd64).should == true
    end

    it "should raise RuntimeError when passed unknown targets" do
      task = Task.new

      lambda {
        task.target! :lol
      }.should raise_error(RuntimeError)
    end

    describe "x86" do
      before(:all) do
        @task = Task.new { |task| task.target! :x86 }
      end

      it "should set the arch value" do
        @task.arch.should == :x86
      end

      it "should set the machine value" do
        @task.machine.should == :x86
      end
    end

    describe "amd64" do
      before(:all) do
        @task = Task.new { |task| task.target! :amd64 }
      end

      it "should set the arch value" do
        @task.arch.should == :x86
      end

      it "should set the machine value" do
        @task.machine.should == :amd64
      end
    end

    describe "lc3b" do
      before(:all) do
        @task = Task.new { |task| task.target! :lc3b }
      end

      it "should set the arch value" do
        @task.arch.should == :lc3b
      end

      it "should set the machine value" do
        @task.machine.should == :lc3b
      end
    end
  end
end
