# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rship}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ozeias Santana"]
  s.date = %q{2009-05-29}
  s.default_executable = %q{rship}
  s.description = %q{Simple RubyGem for automating git tasks}
  s.email = ["oz.santana@gmail.com"]
  s.executables = ["rship"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.markdown"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.markdown", "Rakefile", "bin/rship", "lib/rship.rb", "lib/rship/base.rb", "lib/rship/options.rb", "lib/rship/railsbox_ship.rb", "script/console", "script/destroy", "script/generate", "spec/rship/options_spec.rb", "spec/rship_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.homepage = %q{http://github.com/#{github_username}/#{project_name}}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rship}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Rship is a simple RubyGem for automating git tasks}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.4.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
