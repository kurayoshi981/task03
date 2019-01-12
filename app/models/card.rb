class Card < ApplicationRecord
  belongs_to :list

  has_many :category

  validates :title, length: { in: 1..255}
end
