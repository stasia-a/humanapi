require "json"
require "nestful"
require "humanapi/version"
require "humanapi/config"
require "config/initializers/core_ext"

module HumanAPI

	@config = HumanAPI::Config.new

	def self.config

		if block_given?
			yield(@config)
			@config.configure
		else
			@config
		end

	end

	autoload :Human, 'humanapi/human'
	autoload :App, 'humanapi/app'

end
