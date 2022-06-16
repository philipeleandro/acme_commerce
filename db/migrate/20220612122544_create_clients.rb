# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
