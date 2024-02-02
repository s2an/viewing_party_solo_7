class Movie < ApplicationRecord
  validates_presence_of :original_title, :vote_average

  has_many :viewing_parties
end
