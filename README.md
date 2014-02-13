# HumanAPI

A Ruby client to [HumanAPI](http://humanapi.co).

## Installation

Add this line to your application's Gemfile:

    # We're going to publish our gem soon...
    gem 'humanapi', :git => 'git://github.com/Pazienti/humanpi.git'

## Configuration
The gem is quite simple to configure. You can configure the gem using its home-made initializer:

	HumanAPI.config do |c|
		c.app_id = "<YOUR_APP_ID>"
		c.query_key = "<YOUR_QUERY_KEY>"
		
		# This is the part where the magics happen
		c.human_model = User       # Tell me what is the model you want to use
		c.token_method_name = :human_token   # Tell me the method you use to retrieve the token (Inside the human_model)
	end

## Usage
Once you did the configuration, the usage of the gem is quite ridiculous:

	# Somewhere in your model
	u = User.first
	u.human.profile    #=> Will return the humanapi user's profile
	u.human.query(:activities) #=> Will return everything you asked for

Just use the _human_ instance method from your User instance and that's it ;)

###The query method
The query method is meant to ask whatever you want whenever you want. Here are some permitted methods (according to humanapi) you can use to retrieve user's data:

	profile 
	activities
	blood_glucose
	blood_pressure
	body_fat
	genetic_traits
	heart_rate
	height
	locations
	sleeps
	weight
	bmi

Mixin' up these methods with some options will give you what you want. 

	user.human.query(:activities, :summary => true) #=> will give you a summary of the activities
	user.human.query(:sleeps, :date => "2014-01-01") #=> Will give you a single sleep measurement
	
	# Getting KPIs (KPIs are just single values you get to retrieve a measurements average value)
	user.human.query(:weight) #=> Will give you a single weight value (The avg I guess)
	
	# Getting readings (If you begin with a single avg value and you wanna go deeper)
	user.human.query(:weight, :readings => true)
	
Lastly, as a common rule, I've identified a pattern in humanapis. 
- If the method name is plural, it will give you multiple measurements when calling it. In addition, you can ask for a :summary => true, for a group of value in a specific :date => "DATE" or for a single known measurement :id => "measurement_id"
- If the method name is singular, it will give you a single avg value for what you asked. In addition, you can ask for all :readings => true and for all readings => true in a specific :date=> "DATE".
- If I'm missing something just send me a PM or open an issue.
	
	
## Contributing
Feel free to contribute with your pull requests and forks. Get in touch with us at team@pazienti.it or open an issue.
