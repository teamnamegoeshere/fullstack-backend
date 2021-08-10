class MoviesController < ApplicationController
    def index
    end

    def search
        # @parameter = params[:query].downcase
        #@results = Movie.result
        #puts @results

        # this should ideally be in the model but is in controller now for testing purposes
        require 'httparty'
        # Retrieve API key stored in credentials
        api_key = Rails.application.credentials.tmdb[:api_key]
        # query = @parameter
        # save query param as query variable and lowercase
        query = params[:query].downcase
        # API get request to TMDB using HTTParty
        response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{query}&page=1&include_adult=false")
        # destructure api response to return only results
        @results = response["results"]
        # puts to console for testing purposes
        # puts result
        # render search results as json for frontent
        render json: @results
    end
end
