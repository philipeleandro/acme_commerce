class Order < ApplicationRecord
  validates :reference_number, :payment_date, :status, presence: true
  enum status: { sent: 0, waiting: 1, production: 2, canceled: 3, delivered: 4, posting: 5 }

  belongs_to :client
  attribute :product_id

  before_validation :generate_code
  attribute :status, default: 2

  def generate_code
    self.reference_number = SecureRandom.random_number(9999999999999)
  end

  def sum_product_val
  end
end
