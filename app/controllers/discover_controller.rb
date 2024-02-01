class DiscoverController < ApplicationController

  def index
     movies = params[:name]

     conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
     faraday.headers["api_key"] = Rails.application.credentials.tmdb[:key]
     end

     response = conn.get("3/rated/movies.json")
     stub_request(:get, "https://api.themoviedb.org/3/rated/movies.json").to_return(status: 200, body: "", headers: {})
     json = JSON.parse(response.body, symbolize_names: true)

     @movies = json[:results]
  end
end