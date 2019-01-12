class Category < ApplicationRecord
  has_many :card
  # belongs_to :list
end
