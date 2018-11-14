class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_validation { self.category = category.downcase }

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  def average_rating
    average = 0
    return average if reviews.count.zero?

    average.to_f
    reviews.each { |review| average += review.rating }
    (average / reviews.count).floor
  end
end
