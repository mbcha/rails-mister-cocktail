class Review < ApplicationRecord
  belongs_to :cocktail

  validates :title, presence: true
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }
end
