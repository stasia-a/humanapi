# HumanAPI

A Ruby client to [HumanAPI](http://humanapi.co).

## Installation

Add this line to your application's Gemfile:

    gem 'humanapi'

## Usage

First get a user's OAuth token, perhaps through [omniauth-humanapi](https://github.com/maccman/omniauth-humanapi).

You can pass the token through to every API method call, or set it globally:

    HumanAPI::Human.token = token

## Methods

Rules are simple when calling Human methods: 
- Singular word you will get one single measurement (height => the most recent height measurement)
- Plural word you're likely to get the most recent measurements (activities => most recent activities). Pass an 'id' to your call and you will get just one measurement.
- Sometimes you will use 'readings': you will get all the readings for the chosen section. (readings_height => all height readings). Use an 'id' to get just one of them.
- When you use 'readings_daily': pass a date and you will get all readings for that date (readings_daily_height(&lt;date&gt;) => you get all the height readings for that &lt;date&gt;)
- When you use 'summary': you get an extract of the measurements. Pass a date to get a daily summary

Here are all the supported API methods. For more information, please see the [HumanAPI docs](http://humanapi.co/explorer).


    # Profile

    HumanAPI::Human.summary([token <optional>]) 

    HumanAPI::Human.profile([token <optional>]) 

    # Activity

    HumanAPI::Human.activities([token <optional>]) 

    HumanAPI::Human.activities(id [, token <optional>]) 

    HumanAPI::Human.daily_activities(date [, token <optional>]) 

    HumanAPI::Human.summary_activities([token <optional>]) 

    HumanAPI::Human.summary_activities(date [, token <optional>]) 

    # Blood Glucose

    HumanAPI::Human.blood_glucose([token <optional>])

    HumanAPI::Human.readings_blood_glucose([token <optional>])

    HumanAPI::Human.readings_blood_glucose(id [, token <optional>])

    HumanAPI::Human.daily_blood_glucose(date [, token <optional>])

    # Blood presure

    HumanAPI::Human.blood_pressure([token <optional>])

    HumanAPI::Human.readings_blood_pressure([token <optional>])

    HumanAPI::Human.readings_blood_pressure(id [, token <optional>])

    HumanAPI::Human.daily_blood_pressure(date [, token <optional>])

    # BMI

    HumanAPI::Human.bmi([token <optional>])

    HumanAPI::Human.readings_bmi([token <optional>])

    HumanAPI::Human.readings_bmi(id [, token <optional>])

    HumanAPI::Human.readings_daily_bmi(date [, token <optional>])

    # Body fat

    HumanAPI::Human.body_fat([token <optional>])

    HumanAPI::Human.readings_body_fat([token <optional>])

    HumanAPI::Human.readings_body_fat(id [, token <optional>])

    HumanAPI::Human.readings_daily_body_fat(date [, token <optional>])

    # Genetics

    HumanAPI::Human.genetic_traits([token <optional>])

    # Heart rate

    HumanAPI::Human.heart_rate([token <optional>])

    HumanAPI::Human.readings_heart_rates([token <optional>])

    HumanAPI::Human.readings_heart_rates(id [, token <optional>])

    HumanAPI::Human.readings_daily_heart_rate(date [, token <optional>])

    # Height

    HumanAPI::Human.height([token <optional>])

    HumanAPI::Human.readings_height([token <optional>])

    HumanAPI::Human.readings_height(id [, token <optional>])

    HumanAPI::Human.readings_daily_height(date [, token <optional>])

    # Location

    HumanAPI::Human.locations([token <optional>])

    HumanAPI::Human.locations(id [, token <optional>])

    HumanAPI::Human.daily_locations(date [, token <optional>])

    # Sleep

    HumanAPI::Human.sleeps([token <optional>])

    HumanAPI::Human.sleeps(id  [, token <optional>])

    HumanAPI::Human.daily_sleeps(date [, token <optional>])

    HumanAPI::Human.summary_sleeps([token <optional>])

    HumanAPI::Human.summary_sleeps(date [, token <optional>])

    # Weight

    HumanAPI::Human.weight([token <optional>])

    HumanAPI::Human.readings_weight([token <optional>])

    HumanAPI::Human.readings_weight(id [, token <optional>])

    HumanAPI::Human.daily_weight(date [, token <optional>])
## Contributing
