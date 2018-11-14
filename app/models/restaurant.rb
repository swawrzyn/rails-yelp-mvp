class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_validation { self.category = category.downcase }

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }
end
