class Client < ApplicationRecord
  validates :name, :city, :address, :state, :email, presence: true

  has_many :orders
end
