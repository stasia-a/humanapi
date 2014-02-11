require "json"
require "nestful"
require "humanapi/version"
require "overrides/core_ext"

module HumanAPI
	@options = ""

	def self.config(string)
		@options = string
	end

	autoload :Human, 'humanapi/human'
	autoload :App, 'humanapi/app'
end
