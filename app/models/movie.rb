class Movie < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end
