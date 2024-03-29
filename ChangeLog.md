### 0.3.1 / 2024-01-25

* Switched to using `require_relative` to improve load-times.
* Added `# frozen_string_literal: true` to all files.

### 0.3.0 / 2022-01-07

* Replace rprogram with [command_mapper].
* Added {YASM::Command}.
* Deprecated {YASM::Program} in favor of {YASM::Command}.

### 0.2.1 / 2012-05-27

* `YASM::Task#target!` now raises an `ArgumentError` when given an unknown
  target.
* Replaced ore-tasks with
  [rubygems-tasks](https://github.com/postmodern/rubygems-tasks#readme).

### 0.2.0 / 2011-04-11

* Require rprogram ~> 0.3.
* Allow passing in additional exec-options in {YASM::Program.assemble}
  and {YASM::Program#assemble}.
* Opt into [test.rubygems.org](http://test.rubygems.org/)

### 0.1.1 / 2010-04-15

* Migrated to [Jeweler](http://github.com/technicalpickles/jeweler)
  for packaging rubygems.
* Fixed a few critical typos.

### 0.1.0 / 2009-12-24

* Initial release.

[command_mapper]: https://github.com/postmodern/command_mapper.rb#readme
