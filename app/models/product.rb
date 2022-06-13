class Product < ApplicationRecord
  belongs_to :category

  validates :name, :value, :base_value, :image_url, presence: true
end
