require 'csv'

namespace :setup_csv do
  desc "Insert CSV data"
  task import: :environment do
    CSV.foreach('csv/planilha-acmecommerce.csv') do |row|
    # Category
      if Category.where(name: row[9]).empty?
        category = Category.create(name: row[9])
      else
        category = Category.find_by(name: row[9])
      end
    
    #Product
      if Product.where(name: row[8]).empty?
        product = Product.create(name: row[8], value: row[6].to_f, image_url: row[7], base_value: row[10].to_f, category_id: category.id)
      else
        product = Product.find_by(name: row[8])
      end

    #Client
      if Client.where(email: row[1]).empty?
        client = Client.create(name: row[3], address: row[13], city: row[11], state: row[12], email: row[1])
      else
        client = Client.find_by(email: row[1])
      end

    #Order
      if Order.where(reference_number: row[0].split(" ")[0]).empty?
        order = Order.create(payment_date: row[2].split("T")[0], value: row[5].to_f, client_id: client.id)
        order.status = row[4]
        order.reference_number = row[0].split(" ")[0]
        order.save

        OrderProduct.create(order_id: order.id, product_id: product.id)
      else
        order = Order.find_by(reference_number: row[0].split(" ")[0])
        OrderProduct.create(order_id: order.id, product_id: product.id)
      end
    end
  end
end
