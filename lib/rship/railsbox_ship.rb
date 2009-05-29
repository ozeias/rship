require 'rship/base'

module Rship
	class	RailsboxShip
		include Rship::Base
		extend 	Rship::Base	

		def initialize(arguments)
			@options = arguments

			@branch 	= @options[:branch]
			@message	= @options[:message]
			@current	= %x[git branch | grep '*' | awk '{print $2}'].chop
		end
		
		def start!
			add
			stash
			checkout_and_pull @branch, @current
			rebase @branch
			stash 'apply'
			add
			commit @message
			checkout_and_ship @branch, @current
		end
	end
end