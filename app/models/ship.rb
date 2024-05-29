class Ship < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price_per_day, :available_from, :available_to, presence: true
end
