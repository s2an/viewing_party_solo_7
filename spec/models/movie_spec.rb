require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :original_title }
    it { should validate_presence_of :vote_average }
  end

  describe 'associations' do
    it { should have_many :viewing_parties }
  end
end