# frozen_string_literal: true

# product model
class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, :value, :base_value, :image_url, presence: true
end
