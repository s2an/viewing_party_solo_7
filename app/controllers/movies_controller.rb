class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = params[:movie_id]

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
     faraday.headers["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("3/rated/movies.json")
    json = JSON.parse(response.body, symbolize_names: true)

    @movies = json[:results]
  end
end
