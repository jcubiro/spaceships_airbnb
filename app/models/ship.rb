class Ship < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_and_belongs_to_many :categories

  AIRPORTS = [
    'Amsterdam', 'Athens', 'Belgrade', 'Berlin', 'Bern', 'Bratislava', 'Brussels',
    'Bucharest', 'Budapest', 'Copenhagen', 'Dublin', 'Helsinki', 'Kiev', 'Lisbon',
    'London', 'Luxembourg', 'Madrid', 'Monaco', 'Oslo', 'Paris', 'Prague', 'Reykjavik', 'Riga',
    'Rome', 'San Marino', 'Sarajevo', 'Stockholm', 'Tallinn', 'Vienna', 'Zagreb'
  ]

  validates :name, :description, :capacity, :price_per_day, :available_from, :available_to, presence: true
end
