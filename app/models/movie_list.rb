class MovieList < ApplicationRecord
    # relationships
    belongs_to :lists
end

#require 'httparty'

#class Movie
    #include HTTParty
    #api_key = Rails.application.credentials.tmdb[:api_key]
    #query = @parameter
    #result = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{query}&page=1&include_adult=false")
#end

