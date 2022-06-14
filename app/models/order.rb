class Order < ApplicationRecord
  validates :reference_number, :payment_date, :status, presence: true

  belongs_to :client
end
