# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :reference_number
      t.date :payment_date
      t.float :value
      t.integer :status
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
