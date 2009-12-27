require 'yard'

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  t.options = [
    '--protected',
    '--files', 'History.rdoc',
    '--title', 'Ruby YASM',
    '--quiet'
  ]
end

task :docs => :yard
