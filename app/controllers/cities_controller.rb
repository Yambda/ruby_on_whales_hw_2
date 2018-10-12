require_relative "../services/weather_service"

class CitiesController < ApplicationController

  	def view
	    @cities = City.all
	    @city = params[:city]
	    if @city
		    @w = WeatherService.get(@city)
		    @temp = ((9 / 5) * (@w[:temperature] - 273) + 32).round(1)
		
		    city  = City.new(
				name: @city,
				description: @w[:description],
				temperature: @temp
			)
		end


	end

	def new
		render 'new'
	end

	def create
		@landmark = params[:landmark]
		@population = params[:population]
		@name = params[:name]
		@city = City.new(
			name: @name,
			landmark: @landmark,
			population: @population
		)
		@city.save
		redirect_to action: "view"
	end

	def updateget
		render 'update'
	end

	def updatepost
		city = City.all[params[:name].to_sym]
		if city.nil?
			redirect_to action: "new" and return
		end
		city.update(params)
		redirect_to action: "view"
	end

end
