require 'rails_helper'

RSpec.describe "Search by Title", type: :feature do
    
  describe "US1: Discover Movies: Search by Title - I should see it" do
    before(:each) do
      @user = User.create!(name: 'John', email: 'john@email.com')
      # "When user visits '/users/:id/discover'"
      json_response = File.read('spec/fixtures/top_rated_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/rated/movies.json").to_return(status: 200, body: json_response)
      visit user_discover_index_path(@user)
    end

    it "has a Button to Discover Top Rated Movies" do
      expect(current_path).to eq(user_discover_index_path(@user.id))
      
      expect(page).to have_button("Discover Top Rated Movies")
    end

    it "has a text field to enter keyword(s) to search by movie title" do
      expect(current_path).to eq(user_discover_index_path(@user.id))

      expect(page).to have_field("search by movie title")
    end
    
    it "has a Button to Search by Movie Title" do
      expect(current_path).to eq(user_discover_index_path(@user.id))
      
      expect(page).to have_field("search by movie title")

      fill_in("search by movie title", with: "Gone with the Wind")

      expect(page).to have_button("Search by Movie Title")
    end
  end
end