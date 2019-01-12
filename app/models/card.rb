class Card < ApplicationRecord
  belongs_to :list
  belongs_to :category
  validates :title, length: { in: 1..255}
end
