require "json"
require "nestful"
require "humanapi/version"
require "humanapi/config"
require "config/initializers/core_ext"

module HumanAPI

	@configurations = HumanAPI::Config.new

	def self.configuration
		@configurations
	end

	def self.config
		yield(@configurations) if block_given?

		# Check if the human_model to use and the method name are present
		if configuration.human_model.present? and configuration.token_method_name.present?

			# Check if the method given exists in the given class
			if configuration.human_model.instance_methods.include?(configuration.token_method_name)	

				configuration.human_model.class_eval do 
					def human
						HumanAPI::Human.new(:token => self.send(HumanAPI.configuration.token_method_name.to_sym))
					end
				end

			else
			end
		else
			unless configuration.hardcore
				raise "You must set a human_model and a token_method_name. #{HumanAPI::Config::CHECK_THE_GUIDE}"
			end
		end
	end

	autoload :Human, 'humanapi/human'
	autoload :App, 'humanapi/app'
	
end
