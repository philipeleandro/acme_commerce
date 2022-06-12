class Client < ApplicationRecord
  validates :name, :city, :address, :state, presence: true
end
