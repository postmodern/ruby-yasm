require 'yasm/yasm'

require 'rprogram/task'

module YASM
  #
  # == YASM options:
  #
  # <tt>--version</tt>:: <tt>yasm.version</tt>
  # <tt>--license</tt>:: <tt>yasm.license</tt>
  # <tt>--help</tt>:: <tt>yasm.help</tt>
  #
  # <tt>--arch</tt>:: <tt>yasm.arch</tt>
  # <tt>--parser</tt>:: <tt>yasm.parser</tt>
  # <tt>--preproc</tt>:: <tt>yasm.preprocessor</tt>
  # <tt>--oformat</tt>:: <tt>yasm.output_format</tt>
  # <tt>--dformat</tt>:: <tt>yasm.debug_format</tt>
  # <tt>--lformat</tt>:: <tt>yasm.list_format</tt>
  #
  # <tt>--list</tt>:: <tt>yasm.list_file</tt>
  # <tt>--objfile</tt>:: <tt>yasm.output</tt>
  # <tt>--mapfile</tt>:: <tt>yasm.map_file</tt>
  #
  # <tt>--machine</tt>:: <tt>yasm.machine</tt>
  # <tt>--force-strict</tt>:: <tt>yasm.force_strict</tt>
  # <tt>-w</tt>:: <tt>yasm.inhibit_warnings</tt>
  # <tt>-W</tt>:: <tt>yasm.toggle_warnings</tt>
  # <tt>-M</tt>:: <tt>yasm.gen_makefile_deps</tt>
  # <tt>-E</tt>:: <tt>yasm.redirect_errors_to</tt>
  # <tt>-e</tt>:: <tt>yasm.redirect_errors</tt>
  # <tt>--preproc-only</tt>:: <tt>yasm.preprocessor_only</tt>
  # <tt>-I</tt>:: <tt>yasm.include</tt>
  # <tt>-P</tt>:: <tt>yasm.pre_include</tt>
  # <tt>-D</tt>:: <tt>yasm.define</tt>
  # <tt>-U</tt>:: <tt>yasm.undefine</tt>
  # <tt>-X</tt>:: <tt>yasm.message_style</tt>
  # <tt>--prefix</tt>:: <tt>yasm.prefix</tt>
  # <tt>--suffix</tt>:: <tt>yasm.suffix</tt>
  #
  # <tt>file</tt>:: <tt>yasm.file</tt>
  #
  class Task < RProgram::Task

    # The known YASM targets
    TARGETS = {
      :x86 => {:arch => :x86, :machine => :x86},
      :amd64 => {:arch => :x86, :machine => :amd64},
      :lc3b => {:arch => :lc3b, :machine => :lc3b}
    }

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
                :name => :debug_format
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

    #
    # Creates a new Task object.
    #
    # @param [Hash{Symbol => Object}] options
    #   Additional options for the task.
    #
    # @yield [task]
    #   If a block is given, it will be passed the newly created task
    #   object.
    #
    # @yieldparam [Task]
    #   The new task object.
    #
    def initialize(options={},&block)
      super(options,&block)

      self.parser ||= YASM.parser
      self.arch ||= YASM.arch
      self.machine ||= YASM.machine
      self.debug_format ||= YASM.debug_format
      self.output_format ||= YASM.output_format
    end

    #
    # Sets the YASM arch and machine.
    #
    # @param [String, Symbol] name
    #   The target name.
    #
    # @raise [RuntimeError]
    #   The specified target is unknown.
    #
    # @return [true]
    #   The YASM arch and machine options were set successfully.
    #
    # @example
    #   yasm.target! :amd64
    #
    def target!(name)
      target = TARGETS[name.to_sym]

      unless target
        raise(RuntimeError,"unknown YASM target #{name.inspect}",caller)
      end

      self.arch = target[:arch]
      self.machine = target[:machine]
      return true
    end

    alias syntax parser
    alias syntax= parser=

  end
end
