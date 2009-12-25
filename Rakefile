# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'
require './tasks/spec.rb'
require './tasks/yard.rb'

Hoe.spec('ruby-yasm') do
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')
  self.rubyforge_name = 'ruby-yasm'

  self.extra_deps = [
    ['rprogram', '>=0.1.8']
  ]

  self.extra_dev_deps = [
    ['rspec', '>=1.2.9'],
    ['yard', '>=0.5.2']
  ]
end

# vim: syntax=ruby
