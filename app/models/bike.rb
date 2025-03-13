class Bike < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  validates :bike_type, :brand, :year, :color, presence: { message: "required field" }
  validates :year, length: { is: 4 }

  include PgSearch::Model
  pg_search_scope :search_by_bike_type_and_brand,
                  against: [ :bike_type, :brand ],
                  using: {
  tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
