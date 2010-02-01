# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'

Hoe.plugin :yard

Hoe.spec('ruby-yasm') do
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')

  self.rspec_options += ['--colour', '--format', 'specdoc']

  self.yard_options += ['--protected']
  self.remote_yard_dir = '/'

  self.extra_deps = [
    ['rprogram', '>=0.1.8']
  ]

  self.extra_dev_deps = [
    ['rspec', '>=1.2.9'],
    ['yard', '>=0.5.2']
  ]
end

# vim: syntax=ruby
