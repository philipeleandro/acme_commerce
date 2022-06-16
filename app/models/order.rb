# frozen_string_literal: true

# order model
class Order < ApplicationRecord
  validates  :reference_number, :payment_date, :value, :status, presence: true
  enum status: { sent: 0, waiting: 1, production: 2, canceled: 3, delivered: 4, posting: 5, picking: 6 }

  belongs_to :client
  has_many :order_products
  has_many :products, through: :order_products
  attribute :product_id

  attribute :status, default: 2
end
