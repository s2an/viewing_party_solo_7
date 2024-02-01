class UsersController < ApplicationController

   def new
      @user = User.new
   end

   def show
      @user = User.find(params[:id])
   end

   def create
      user = User.new(user_params)
      if user.save
         flash[:success] = 'Successfully Created New User'
         redirect_to user_path(user)
      else
         flash[:error] = "#{error_message(user.errors)}"
         redirect_to register_user_path
      end   
   end

   # def search
   #    movies = params[:name]

   #    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
   #    faraday.headers["api_key"] = Rails.application.credentials.tmdb[:key]
   #    end

   #    response = conn.get("3/rated/movies.json")

   #    json = JSON.parse(response.body, symbolize_names: true)

   #    @movies = json[:results]
   # end



private

  def user_params
      params.require(:user).permit(:name, :email)
  end

end