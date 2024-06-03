class Ship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_and_belongs_to_many :categories

  AIRPORTS = [
    'Amsterdam', 'Athens', 'Belgrade', 'Berlin', 'Bern', 'Bratislava', 'Brussels',
    'Bucharest', 'Budapest', 'Copenhagen', 'Dublin', 'Helsinki', 'Kiev', 'Lisbon',
    'London', 'Luxembourg', 'Madrid', 'Monaco', 'Oslo', 'Paris', 'Prague', 'Reykjavik', 'Riga',
    'Rome', 'San Marino', 'Sarajevo', 'Stockholm', 'Tallinn', 'Vienna', 'Zagreb'
  ]

  validates :name, :description, :capacity, :price_per_day, :available_from, :available_to, presence: true
  validates :price_per_day, numericality: { greater_than: 0 }
  validate :available_dates_valid

  private

  def available_dates_valid
    return if available_from.blank? || available_to.blank?
    return if available_from <= available_to

    errors.add(:available_to, "must be after the available from date")
  end
end
