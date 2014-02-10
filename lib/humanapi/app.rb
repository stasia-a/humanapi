
# THE MODULE
module HumanAPI
	# THE CLASS
	class App < Nestful::Resource

		# The host of the api
		endpoint 'https://api.humanapi.co'

		# The path of the api
		path '/v1/apps'

		# TODO: These methods should go into a config file =======
		
		# Set the AppId
		def self.app_id=(value)
			@app_id = value
		end

		# Get the AppId
		def self.app_id
			@app_id
		end

		# Set the QueryKey
		def self.query_key=(value)
			@query_key = value
		end

		# Get the QueryKey
		def self.query_key
			@query_key
		end

		# ========================================================

		# Get the users of your app
		def self.users(query_key = query_key)
			authentication = Base64.encode64("#{query_key}:") 
			get("#{app_id}/users", {}, {:headers => {"Authorization" => "Basic #{authentication}"}})
		end

	end
end