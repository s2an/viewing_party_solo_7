require 'rails_helper'

RSpec.describe "/users/:id/discover", type: :feature do
    
  describe "US1: Discover Movies: Search by Title" do
    # As a user,
    # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
    # I should see
    # - a Button to Discover Top Rated Movies
    # - a text field to enter keyword(s) to search by movie title
    # - a Button to Search by Movie Title

    before(:each) do
      @user = User.create!(name: 'John', email: 'john@email.com')
      
      json_response = File.read('spec/fixtures/top_rated_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/rated/movies.json").to_return(status: 200, body: json_response)

      visit user_discover_index_path(@user)
    end

    it "has a Button to Discover Top Rated Movies" do
      expect(current_path).to eq(user_discover_index_path(@user.id))
      
      expect(page).to have_button("Discover Top Rated Movies")
    end
    
    it "allows to search by movie title" do
      expect(current_path).to eq(user_discover_index_path(@user.id))
      
      fill_in(:search, with: "Gone with the Wind")

      expect(page).to have_button("Search by Movie Title")
    end
  end

  describe "US2: Movie Results Page" do
    # When I visit the discover movies page ('/users/:id/discover'),
    # and click on either the Discover Top Rated Movies button or fill out the movie title search and click the Search button,
    # I should be taken to the movies results page (`users/:user_id/movies`) where I see: 
    # - Title (As a Link to the Movie Details page (see story #3))
    # - Vote Average of the movie
    # I should also see a button to return to the Discover Page.
  
    before(:each) do
      @user = User.create!(name: 'John', email: 'john@email.com')
      
      json_response = File.read('spec/fixtures/top_rated_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/rated/movies.json").to_return(status: 200, body: json_response)

      visit user_discover_index_path(@user)
    end

    it "clicks the Discover Top Rated Movies Button" do
      expect(current_path).to eq(user_discover_index_path(@user.id))

      click_button("Discover Top Rated Movies")

      expect(current_path).to eq(user_movies_path(@user))
      
      expect(page).to have_link(@movie[:original_title], href: movie_path(movie))
      expect(page).to have_content(@movie[:vote_average])
      expect(page).to have_button("Return to Discover Page")
    end
  end
end