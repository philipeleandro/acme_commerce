# frozen_string_literal: true

# model use to many to many association
class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
end
