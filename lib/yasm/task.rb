require 'rprogram/task'

module YASM
  class Task < RProgram::Task

    long_option :flag => '--version'
    long_option :flag => '--license'

    long_option :flag => '--help'
    long_option :flag => '--arch', :equals => true
    long_option :flag => '--parser', :equals => true
    long_option :flag => '--preproc',
                :equals => true,
                :name => :preprocessor
    long_option :flag => '--oformat',
                :equals => true,
                :name => :output_format
    long_option :flag => '--dformat',
                :equals => true,
                :name => :debugging_format
    long_option :flag => '--lformat',
                :equals => true,
                :name => :list_format

    long_option :flag => '--list',
                :equals => true,
                :name => :list_file
    long_option :flag => '--objfile',
                :equals => true,
                :name => :output
    long_option :flag => '--mapfile',
                :equals => true,
                :name => :map_file

    long_option :flag => '--machine', :equals => true
    long_option :flag => '--force-strict'
    short_option :flag => '-w', :name => :inhibit_warnings
    short_option :flag => '-W', :name => :toggle_warnings
    short_option :flag => '-M', :name => :gen_makefile_deps
    short_option :flag => '-E', :name => :redirect_errors_to
    short_option :flag => '-s', :name => :redirect_errors
    long_option :flag => '--preproc-only', :name => :preprocessor_only
    short_option :flag => '-I', :name => :include, :multiple => true
    short_option :flag => '-P', :name => :pre_include, :multiple => true
    short_option :flag => '-D', :name => :define, :multiple => true
    short_option :flag => '-U', :name => :undefine, :multiple => true
    short_option :flag => '-X', :name => :message_style
    long_option :flag => '--prefix'
    long_option :flag => '--suffix'

    non_option :tailing => true, :name => :file

    def gas!
      self.parser = :gas
      return true
    end

    alias gnu! gas!

    def nasm!
      self.parser = :nasm
      return true
    end

    def tasm!
      self.parser = :tasm
      return true
    end

    def x86!
      self.arch = :x86
      self.machine = :x86
      return true
    end

    def amd64!
      self.arch = :x86
      self.machine = :amd64
      return true
    end

    def dbg!
      self.output_format = :dbg
      return true
    end

    def bin!
      self.output_format = :bin
      return true
    end

    def dos_exe!
      self.output_format = :dosexe
      return true
    end

    def elf!
      self.output_format = :elf
      return true
    end

    def elf32!
      self.output_format = :elf32
      return true
    end

    def elf64!
      self.output_format = :elf64
      return true
    end

    def coff!
      self.output_format = :coff
      return true
    end

    def macho!
      self.output_format = :macho
      return true
    end

    def macho32!
      self.output_format = :macho32
      return true
    end

    def macho64!
      self.output_format = :macho64
      return true
    end

    def rdf!
      self.output_format = :rdf
      return true
    end

    def win32!
      self.output_format = :win32
      return true
    end

    def win64!
      self.output_format = :win64
      return true
    end

    alias x64! win64!

    def xdf!
      self.output_format = :xdf
      return true
    end

  end
end
