
# THE MODULE
module HumanApi
	# THE CLASS
	class Human < Nestful::Resource

		attr_reader :token

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

		def initialize(options)
			@token = options[:access_token]
			super
		end

		# Profile =====================================

		def summary
			get('', :access_token => token)
		end

		def profile
			query('profile')
		end

		# =============================================

		def query(method, options = {})

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
					if options[:summaries] == true
						url += "/summaries"
					elsif options[:summary] == true
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
					url += "/#{options[:id]}"
				end

				params = { :access_token => token }
				params.merge!(:start_date => options[:start_date]) if options[:start_date]
				params.merge!(:end_date => options[:end_date]) if options[:end_date]
				params.merge!(:limit => options[:limit])

				# Make the request finally
				result = get(url, params)

				# Converting to json the body string
				JSON.parse(result.body)
			else
				# Tell the developer the method is not there
				"The method '#{method}' does not exist!"
			end

		end

	end
end
