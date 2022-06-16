# frozen_string_literal: true

require 'csv'

namespace :setup_csv do
  desc 'Insert CSV data'
  task import: :environment do
    CSV.foreach('csv/planilha-acmecommerce.csv') do |row|
      # Category
      category = if Category.where(name: row[9]).empty?
                   Category.create(name: row[9])
                 else
                   Category.find_by(name: row[9])
                 end

      # Product
      product = if Product.where(name: row[8]).empty?
                  Product.create(name: row[8], value: row[6].to_f, image_url: row[7], base_value: row[10].to_f,
                                 category_id: category.id)
                else
                  Product.find_by(name: row[8])
                end

      # Client
      client = if Client.where(email: row[1]).empty?
                 Client.create(name: row[3], address: row[13], city: row[11], state: row[12], email: row[1])
               else
                 Client.find_by(email: row[1])
               end

      # Order
      if Order.where(reference_number: row[0].split(' ')[0]).empty?
        order = Order.create(payment_date: row[2].split('T')[0], value: row[5].to_f, client_id: client.id)
        order.status = row[4]
        order.reference_number = row[0].split(' ')[0]
        order.save

      else
        order = Order.find_by(reference_number: row[0].split(' ')[0])
      end
      OrderProduct.create(order_id: order.id, product_id: product.id)
    end
  end
end
