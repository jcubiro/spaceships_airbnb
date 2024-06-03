class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ship

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date, :dates_available

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    return if end_date >= start_date

    errors.add(:end_date, "must be after the start date")
  end

  def dates_available
    return if start_date.blank? || end_date.blank?
    return unless ship.bookings.where("start_date < ? AND end_date > ?", end_date, start_date).exists?

    errors.add(:base, "dates are not available")
  end
end
