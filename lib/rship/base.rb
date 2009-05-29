module Rship
	module Base	
		def run(command)
		  result = system(command)
		  raise("error, process exited with status #{$?.exitstatus}") unless result
		end
	
		def msg(message)
			puts "--> executing '#{message}'\n" unless @options[:quit]
		end
	
		def add
			msg "git add ."
			run "git add ."
		end
	
		def checkout(branch)
			msg "git checkout #{branch}"
			run "git checkout #{branch}"
		end
	
		def commit(message)
			msg "git commit -m '#{message}'"
			run "git commit -m '#{message}'"
		end
	
		def pull(branch)
			msg "git pull origin #{branch}"
			run "git pull origin #{branch}"
		end

		def stash(apply = nil)
			msg "git stash #{apply}"
			run "git stash #{apply}"
		end
	
		def rebase(branch)
			msg "git rebase #{branch}"
			run "git rebase #{branch}"
		end

		def checkout_and_pull(one, two)
			checkout one
			pull one
			checkout two
		end
	
		def checkout_and_ship(one, two)
			checkout one
			rebase two
			ship one
			checkout two
		end

		def ship(branch)
			msg "git push origin #{branch}"
			run "git push origin #{branch}"
		end
	end
end