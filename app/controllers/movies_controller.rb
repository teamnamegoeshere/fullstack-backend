class MoviesController < ApplicationController
    def index
    end

    def search
        @parameter = params[:query].downcase
        #@results = Movie.result
        #puts @results

        # this should ideally be in the model but is in controller now for testing purposes
        require 'httparty'
        api_key = Rails.application.credentials.tmdb[:api_key]
        query = @parameter
        result = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{query}&page=1&include_adult=false")
        # puts to console for testing purposes
        puts result
    end
end
