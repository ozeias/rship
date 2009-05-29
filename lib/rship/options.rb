require 'optparse'
require 'rship/railsbox_ship'

module Rship
  class Options
    def self.default_options
			{ :quiet => false, :verbose => true, :merge	=> false, :deploy	=> false, :branch => 'master', :message => '' }
    end
    
    @@opts = default_options

    def self.[](key)
      @@opts[key]
    end

    def self.parse_args(args)
      result = default_options
      parser = OptionParser.new { |opts| set_options(opts, result) }
      parser.parse!(args)
      result
    end
    
    def self.set_options(opts, config)
      opts.banner = <<EOB
Usage: #{opts.program_name} [options]

See http://wiki.github.com/ozeias/rship for detailed help.
EOB

			# opts.separator "\n"
			# set_quiet_option(config, opts)
			# set_verbose_option(config, opts)
			opts.separator "\nOptions:"
      set_git_option(config, opts)
      set_help_option(opts)
      set_version_option(opts)
    end

    def self.parse(args)
      begin
        @@opts = parse_args(args)

        if @@opts[:message].length > 0
					railsbox_ship = RailsboxShip.new @@opts
					railsbox_ship.start!
        else
          fatal_error('do you need specify commit message')
        end
      rescue OptionParser::ParseError, SystemCallError => err
        fatal_error(err)
      end
    end

  private
    
    def self.set_version_option(opts)
      opts.on("-v", "--version", "Show version") do
        puts "#{opts.program_name} #{Rship::VERSION}"
        exit(0)
      end
    end

    def self.set_help_option(opts)
      opts.on("-h", "--help", "Show this message") do
        puts opts
        exit(0)
      end
    end
		
		def self.set_verbose_option(config, opts)
			opts.on('-v', '--verbose', "be verbose") do
				config[:verbose] = true
			end			
		end
		
		def self.set_quiet_option(config, opts)
			opts.on('-q', '--quiet', "be quiet") do
				config[:quiet] = true
			end
		end

    def self.set_git_option(config, opts)
      opts.on('-m', '--message "MESSAGE"', 'Specify commit message') do |arg|
        config[:message] = arg unless arg.nil?
      end

      opts.on('-b', "--branch BRANCH", 'Specify commit branch') do |arg|
        config[:branch] = arg unless arg.nil?
      end
			
			# TODO
			# opts.on('-d', "--deploy", 'Deploy commit') do
			# 	config[:deploy] = true
			# end

			# TODO
			# opts.on('', "--merge", 'Use merge instead of rebase') do
			# 	config[:merge] = true
			# end
    end

    def self.fatal_error(err) # :nodoc:
      puts "Error: #{err}"
      puts "Use '-h' for help."
      exit(1)
    end
  end
end