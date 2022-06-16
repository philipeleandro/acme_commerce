# frozen_string_literal: true

# category model
class Category < ApplicationRecord
  has_many  :products
  validates :name, presence: true
end
