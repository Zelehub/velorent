class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :rental_date, :rental_date_end, presence: true
  validate :check_date
  # validates :status, inclusion: { in: %w(created pending confirmed declined) }

  private

  def check_date
    return if rental_date.blank? || rental_date_end.blank?

    if rental_date_end < rental_date
      errors.add(:rental_date, "can't be after the end date dummy")
    end
  end
end
