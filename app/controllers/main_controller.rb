require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
    
    @city = params[:city]
    if @city
	    @w = WeatherService.get(@city)
	    @temp = ((9 / 5) * (@w[:temperature] - 273) + 32).round(1)
	
	    city  = City.new(
			name: @city,
			description: @w[:description],
			temperature: @temp,
			landmark: "Nothing",
			population: 0
		)

		city.save

	end

  end

end
