module HumanAPI
  class Human < Nestful::Resource
    endpoint 'https://api.humanapi.co'
    path '/v1/human'

    def self.token=(value)
      @token = value
    end

    def self.token
      @token
    end

    # Profile

    def self.profile(token = token)
      get('profile', :access_token => token)
    end

    def self.summary(token = token)
      get('', :access_token => token)
    end

    # Activity

    def self.activities(token = token)
      get("activities", :access_token => token)
    end

    def self.activities(id, token = token)
      get("activities/#{id}", :access_token => token)
    end

    def self.daily_activities(date, token = token)
      get("activities/daily/#{date.strftime('%F')}", :access_token => token)
    end

    def self.summary_activities(token = token)
      get("activities/summary", :access_token => token)
    end

    def self.summary_activities(date, token = token)
      get("activities/summary/#{date.strftime('%F')}", :access_token => token)
    end

    # Blood Glucose

    def self.blood_glucose(token = token)
      get("blood_glucose", :access_token => token)
    end

    def self.readings_blood_glucose(token = token)
      get('blood_glucose/readings', :access_token => token)
    end

    def self.readings_blood_glucose(id, token = token)
      get("blood_glucose/readings/#{id}", :access_token => token)
    end

    def self.daily_blood_glucose(date, token = token)
      get("blood_glucose/readings/daily/#{date.strftime('%F')}", :access_token => token)
    end

    # Blood presure

    def self.blood_pressure(token = token)
      get("blood_pressure", :access_token => token)
    end

    def self.readings_blood_pressure(token = token)
      get("blood_pressure/readings", :access_token => token)
    end

    def self.readings_blood_pressure(id, token = token)
      get("blood_pressure/readings/#{id}", :access_token => token)
    end

    def self.daily_blood_pressure(date, token = token)
      get("blood_pressure/readings/daily/#{date.strftime('%F')}", :access_token => token)
    end

    # BMI

    def self.bmi(token = token)
      get("bmi", :access_token => token)
    end

    def self.readings_bmi(token = token)
      get('bmi/readings', :access_token => token)
    end

    def self.readings_bmi(id, token = token)
      get("bmi/readings/#{id}", :access_token => token)
    end

    def self.readings_daily_bmi(date, token = token)
      get("bmi/readings/daily/#{date.strftime('%F')}", :access_token => token)
    end

    # Body fat

    def self.body_fat(token = token)
      get("body_fat", :access_token => token)
    end

    def self.readings_body_fat(token = token)
      get('body_fat/readings', :access_token => token)
    end

    def self.readings_body_fat(id, token = token)
      get("body_fat/readings/#{id}", :access_token => token)
    end

    def self.readings_daily_body_fat(date, token = token)
      get("body_fat/daily/#{date.strftime('%F')}", :access_token => token)
    end

    # Genetics

    def self.genetic_traits(token = token)
      get('genetic/traits', :access_token => token)
    end

    # Heart rate

    def self.heart_rate(token = token)
      get("heart_rate", :access_token => token)
    end

    def self.readings_heart_rates(token = token)
      get('heart_rate/readings', :access_token => token)
    end

    def self.readings_heart_rates(id, token = token)
      get("heart_rate/readings/#{id}", :access_token => token)
    end

    def self.readings_daily_heart_rate(date, token = token)
      get("heart_rate/readings/daily/#{date.strftime('%F')}", :access_token => token)
    end

    # Height

    def self.height(token = token)
      get("height", :access_token => token)
    end

    def self.readings_height(token = token)
      get("height/readings", :access_token => token)
    end

    def self.readings_height(id, token = token)
      get("height/readings/#{id}", :access_token => token)
    end

    def self.readings_daily_height(date, token = token)
      get("height/daily/#{date.strftime('%F')}", :access_token => token)
    end

    # Location

    def self.locations(token = token)
      get('locations', :access_token => token)
    end

    def self.locations(id, token = token)
      get("locations/#{id}", :access_token => token)
    end

    def self.daily_locations(date, token = token)
      get("locations/daily/#{date.strftime('%F')}", :access_token => token)
    end

    # Sleep

    def self.sleeps(token = token)
      get("sleeps", :access_token => token)
    end

    def self.sleeps(id , token = token)
      get("sleeps/#{id}", :access_token => token)
    end

    def self.daily_sleeps(date, token = token)
      get("sleeps/daily/#{date.strftime('%F')}", :access_token => token)
    end

    def self.summary_sleeps(token = token)
      get("sleeps/summary", :access_token => token)
    end

    def self.summary_sleeps(date, token = token)
      get("sleeps/summary/#{date.strftime('%F')}", :access_token => token)
    end

    # Weight

    def self.weight(token = token)
      get("weight", :access_token => token)
    end

    def self.readings_weight(token = token)
      get("weight/readings", :access_token => token)
    end

    def self.readings_weight(id, token = token)
      get("weight/readings/#{id}", :access_token => token)
    end

    def self.daily_weight(date, token = token)
      get("weight/readings/daily/#{date.strftime('%F')}", :access_token => token)
    end

  end
end