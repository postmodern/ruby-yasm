require 'yasm/task'

require 'spec_helper'

describe Task do
  describe "default" do
    describe "parser" do
      before(:all) do
        @old_parser = YASM.parser

        YASM.parser = :tasm
      end

      it "should have a default parser value" do
        task = Task.new
        task.parser.should == :tasm
      end

      it "should allow overriding the default parser" do
        task = Task.new(:parser => :gas)
        task.parser.should == :gas
      end

      after(:all) do
        YASM.parser = @old_parser
      end
    end

    describe "arch" do
      before(:all) do
        @old_arch = YASM.arch

        YASM.arch = :lc3b
      end

      it "should have a default arch value" do
        task = Task.new
        task.arch.should == :lc3b
      end

      it "should allow overriding the default arch" do
        task = Task.new(:arch => :x86)
        task.arch.should == :x86
      end

      after(:all) do
        YASM.arch = @old_arch
      end
    end

    describe "machine" do
      before(:all) do
        @old_machine = YASM.machine

        YASM.machine = :amd64
      end

      it "should have a default machine value" do
        task = Task.new
        task.machine.should == :amd64
      end

      it "should allow overriding the default machine" do
        task = Task.new(:machine => :x86)
        task.machine.should == :x86
      end

      after(:all) do
        YASM.machine = @old_machine
      end
    end

    describe "debug_format" do
      before(:all) do
        @old_debug_format = YASM.debug_format

        YASM.debug_format = :stabs
      end

      it "should have a default debug_format value" do
        task = Task.new
        task.debug_format.should == :stabs
      end

      it "should allow overriding the default debug_format" do
        task = Task.new(:debug_format => :null)
        task.debug_format.should == :null
      end

      after(:all) do
        YASM.debug_format = @old_debug_format
      end
    end

    describe "output_format" do
      before(:all) do
        @old_output_format = YASM.output_format

        YASM.output_format = :elf64
      end

      it "should have a default output_format value" do
        task = Task.new
        task.output_format.should == :elf64
      end

      it "should allow overriding the default output_format" do
        task = Task.new(:output_format => :bin)
        task.output_format.should == :bin
      end

      after(:all) do
        YASM.output_format = @old_output_format
      end
    end
  end

  describe "target_x86!" do
    before(:all) do
      @task = Task.new { |task| task.target_x86! }
    end

    it "should set the arch value" do
      @task.arch.should == :x86
    end

    it "should set the machine value" do
      @task.machine.should == :x86
    end
  end

  describe "target_amd64!" do
    before(:all) do
      @task = Task.new { |task| task.target_amd64! }
    end

    it "should set the arch value" do
      @task.arch.should == :x86
    end

    it "should set the machine value" do
      @task.machine.should == :amd64
    end
  end
end
