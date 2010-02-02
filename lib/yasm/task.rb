require 'yasm/yasm'

require 'rprogram/task'

module YASM
  #
  # ## YASM options:
  #
  # * `--version` -  `yasm.version`
  # * `--license` -  `yasm.license`
  # * `--help` -  `yasm.help`
  #
  # * `--arch` -  `yasm.arch`
  # * `--parser` -  `yasm.parser`
  # * `--preproc` -  `yasm.preprocessor`
  # * `--oformat` -  `yasm.output_format`
  # * `--dformat` -  `yasm.debug_format`
  # * `--lformat` -  `yasm.list_format`
  #
  # * `--list` -  `yasm.list_file`
  # * `--objfile` -  `yasm.output`
  # * `--mapfile` -  `yasm.map_file`
  #
  # * `--machine` -  `yasm.machine`
  # * `--force-strict` -  `yasm.force_strict`
  # * `-w` -  `yasm.inhibit_warnings`
  # * `-W` -  `yasm.toggle_warnings`
  # * `-M` -  `yasm.gen_makefile_deps`
  # * `-E` -  `yasm.redirect_errors_to`
  # * `-e` -  `yasm.redirect_errors`
  # * `--preproc-only` -  `yasm.preprocessor_only`
  # * `-I` -  `yasm.include`
  # * `-P` -  `yasm.pre_include`
  # * `-D` -  `yasm.define`
  # * `-U` -  `yasm.undefine`
  # * `-X` -  `yasm.message_style`
  # * `--prefix` -  `yasm.prefix`
  # * `--suffix` -  `yasm.suffix`
  #
  # `file` -  `yasm.file`
  #
  class Task < RProgram - Task

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
    # @option options [String, Symbol] :target
    #   The arch/machine to target.
    #
    # @yield [task]
    #   If a block is given, it will be passed the newly created task
    #   object.
    #
    # @yieldparam [Task] task
    #   The new task object.
    #
    # @see Task#target!
    #
    def initialize(options={},&block)
      target = options.delete(:target)

      super(options,&block)

      self.target!(target) if target

      self.parser ||= YASM.parser
      self.arch ||= YASM.arch
      self.machine ||= YASM.machine
      self.debug_format ||= YASM.debug_format
      self.output_format ||= YASM.output_format
    end

    #
    # Sets the YASM `arch` and `machine`.
    #
    # @param [String, Symbol] name
    #   The target name.
    #
    # @raise [RuntimeError]
    #   The specified target is unknown.
    #
    # @return [true]
    #   The YASM `arch` and `machine` options were set successfully.
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
