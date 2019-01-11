class List < ApplicationRecord
  belongs_to :user
  has_many :create, dependent: :destroy
  has_many :cards
  validates :title, length: { in: 1..255 }
end
