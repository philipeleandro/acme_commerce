class Client < ApplicationRecord
  validates :name, :city, :address, :state, presence: true

  has_many :orders
end
