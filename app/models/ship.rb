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

  validates :name, :description, :capacity, :price_per_day, :location, :available_from, :available_to, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 4, less_than_or_equal_to: 20 }
  validates :location, inclusion: { in: AIRPORTS, message: "%<value> is not a valid airport" }
end
