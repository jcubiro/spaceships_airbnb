class Ship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :description, :price_per_day, :available_from, :available_to, presence: true
  validates :price_per_day, numericality: { greater_than: 0 }
  validate :available_dates_valid

  private

  def available_dates_valid
    return if available_from.blank? || available_to.blank?

    if available_from > available_to
      errors.add(:available_to, "must be after the available from date")
    end
  end
end
