require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/rship'

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'rship' do
  self.developer "Oz\303\251ias Sant'ana", 'oz.santana@gmail.com'
  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = self.name # TODO this is default value
  # self.extra_deps         = [['activesupport','>= 2.0.2']]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# require 'rubygems' unless ENV['NO_RUBYGEMS']
# %w[rake rake/clean fileutils newgem rubigen hoe].each { |f| require f }
# require File.dirname(__FILE__) + '/lib/rship'
# 
# # Generate all the Rake tasks
# # Run 'rake -T' to see list of generated tasks (from gem root directory)
# $hoe = Hoe.spec('rship', Rship::VERSION) do |p|
#   p.developer("Oz\303\251ias Sant'ana", 'oz.santana@gmail.com')
#   p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
#   p.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
#   p.rubyforge_name       = p.name # TODO this is default value

#   # p.extra_deps         = [
#   #   ['activesupport','>= 2.0.2'],
#   # ]
#   p.extra_dev_deps = [
#     ['newgem', ">= #{::Newgem::VERSION}"]
#   ]
#   
#   p.clean_globs |= %w[**/.DS_Store tmp *.log]
#   path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
#   p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
#   p.rsync_args = '-av --delete --ignore-errors'
# end
# 
# require 'newgem/tasks' # load /tasks/*.rake
# Dir['tasks/**/*.rake'].each { |t| load t }
# 
# # TODO - want other tests/tasks run by default? Add them to the list
# # task :default => [:spec, :features]
