RSpec.describe "Search by Title", type: :feature do
  describe "When user visits '/users/:id/discover'" do
    before(:each) do
      # @user = User.create!(name: "Tommy", email: "tommy@email.com")
      # @user = User.create!(name: "Sam", email: "sam@email.com")

      visit user_discover_path
    end
    
    describe "US1: Discover Movies: Search by Title - I should see it" do

      it "has a Button to Discover Top Rated Movies" do
        expect(current_path).to eq(user_discover_path)
        
        expect(page).to have_button("Discover Top Rated Movies")
      end

      it "has a text field to enter keyword(s) to search by movie title" do
        expect(current_path).to eq(user_discover_path)

        expect(page).to have_field("Search by Movie Title")
      end
      
      it "has a Button to Search by Movie Title" do
        expect(current_path).to eq(user_discover_path)
        
        expect(page).to have_field("Search by Movie Title")

        fill_in ("Gone With the Wind")

        expect(page).to have_button("Search by Movie Title")

        click("Search by Movie Title")
      end
    end
  end
end