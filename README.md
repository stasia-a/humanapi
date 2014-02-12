# HumanAPI

A Ruby client to [HumanAPI](http://humanapi.co).

## Installation

Add this line to your application's Gemfile:

    gem 'humanapi'

## Configuration
The configuration is made up of two parts. 
###The app info configuration
In this part you should give the gem your app_id and your query_key in order to use advanced features contained in the gem - like creating users for your humanapi app and getting a list of your humanpi app users.
Here's how it works:
    
    HumanAPI.config do |configuration|
        configuration.app_id = "<yourappid>"
        configuration.query_key = "<yourquerykey>"
    end
That's it for the general info of the app.

###The user token configuration
First get a user token - maybe - through [omniauth-humanapi](https://github.com/maccman/omniauth-humanapi).
Once you stored it - you should use tell the gem what the token of your user is.
You can pass the token through to every API method call, or set it globally:

    HumanAPI::Human.token = token

Set it wherever you want. Remember that for now you need to set it for every user

## Usage
Call the method query and pass in the method you want to call:
    
    HumanAPI::Human.query(:activites) #=> An array of activites

You can pass options like ':readings' (in case you want all readings of one resource), ':summary' (if you want an extract of the resource measurements), ':id' (if you would like just one measurement) and ':date' (in case you want your results extracted from a specific date).

    HumanAPI::Human.query(:activites, {:summary => true}) #=> An array of activites

    # or

    HumanAPI::Human.query(:activites, {:date => Date.today}) #=> An array of activites

    # or

    HumanAPI::Human.query(:activites, {:id => "52f6dc0a77de67ce6f04046f"}) #=> A single activity

Here are all the supported API methods. For more information, please see the [HumanAPI docs](http://humanapi.co/explorer).
    
    #TODO: add specification for each method
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

## Contributing
Feel free to contribute with your pull requests!