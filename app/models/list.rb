class List < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  # has_many :category
  validates :title, length: { in: 1..255 }
end
