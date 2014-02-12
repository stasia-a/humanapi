require "json"
require "nestful"
require "humanapi/version"
require "humanapi/config"
require "overrides/core_ext"

module HumanAPI
	@configurations = HumanAPI::Config.new

	def self.configuration
		@configurations
	end
	def self.config
		yield(@configurations) if block_given?
	end

	autoload :Human, 'humanapi/human'
	autoload :App, 'humanapi/app'
end
