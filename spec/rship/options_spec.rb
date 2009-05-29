require File.dirname(__FILE__) + '/../spec_helper.rb'
 
require 'rship/options'

include Rship

describe Options do
  it "should wrong number of arguments" do
		lambda do
			Options.parse_args()
		end.should raise_error(ArgumentError, 'wrong number of arguments (0 for 1)')
  end
	
	it "should exit when no have commit message in arguments" do
		lambda do
			Options.parse(['--merge'])
		end.should raise_error(SystemExit)
	end
end