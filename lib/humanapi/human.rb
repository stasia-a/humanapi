
# THE MODULE
module HumanAPI
	# THE CLASS
	class Human < Nestful::Resource

		# The host of the api
		endpoint 'https://api.humanapi.co'

		# The path of the api
		path '/v1/human'

		# The available methods for this api
		AVAILABLE_METHODS = [
							:profile, 
							:activities, 
							:blood_glucose, 
							:blood_pressure, 
							:body_fat, 
							:genetic_traits, 
							:heart_rate, 
							:height, 
							:locations, 
							:sleeps, 
							:weight, 
							:bmi
							]

		# Set the token
		def self.token=(value)
			@token = value
		end

		# Get the token
		def self.token
			@token
		end

		# Profile =====================================

		def self.summary(token = token)
			get('', :access_token => token)
		end

		def self.profile(token = token)
			query('profile')
		end

		# =============================================

		def self.query(method, options = {}, token = token)

			# Is this method in the list?
			if AVAILABLE_METHODS.include? method.to_sym
				# From sym to string
				method = method.to_s

				# The base of the url
				url = "#{method}"

				# If it is a singular word prepare for readings
				if method.is_singular?
					if options[:readings] == true
						url += "/readings"
					end
				else
					if options[:summary] == true
						url += "/summary"
					end
				end

				# You passed a date
				if options[:date].present?
					# Make a request for a specific date
					url += "/daily/#{options[:date]}"

				# If you passed an id
				elsif options[:id].present?
					# Make a request for a single 
					url += "/#{id}"
				end

				# Make the request finally
				result = get(url, :access_token => token)

				# Converting to json the body string
				JSON.parse(result.body)
			else
				# Tell the developer the method is not there
				"The method '#{method}' does not exist!"
			end

		end

	end
end