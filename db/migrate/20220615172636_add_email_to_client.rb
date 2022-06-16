# frozen_string_literal: true

# Add column to client
class AddEmailToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :email, :string
  end
end
