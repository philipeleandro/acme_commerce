# frozen_string_literal: true

# create model to association many to many
class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.references :order, :product

      t.timestamps
    end
  end
end
