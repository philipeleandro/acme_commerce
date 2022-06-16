# frozen_string_literal: true

# client model
class Client < ApplicationRecord
  validates :name, :city, :address, :state, :email, presence: true

  has_many :orders
end
