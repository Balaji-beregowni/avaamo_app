# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

require 'faker'

# Generate 1000 fake users
users = []
1000.times do
  users << { username: Faker::Internet.username,
             email: Faker::Internet.email,
             phone: Faker::PhoneNumber.phone_number,
             created_at: Faker::Time.backward(days: 365),
             updated_at: Time.now
            }
end
User.insert_all(users)

# Generate 1000 fake products
products = []
1000.times do
  products << { code: Faker::Alphanumeric.alpha(number: 6).upcase,
                name: Faker::Commerce.product_name,
                category: Faker::Commerce.department,
                created_at: Faker::Time.backward(days: 365),
                updated_at: Time.now
              }
end
Product.insert_all(products)

# Generate 1000 fake orders
orders = []
1000.times do
  orders << { user_id: rand(1..1000),
              quantity: rand(1..10),
              total_price: rand(10.0..1000.0),
              date_of_purchase: Faker::Date.backward(days: 365),
              shipping_address: Faker::Address.full_address,
              created_at: Faker::Time.backward(days: 365),
              updated_at: Time.now
            }
end
Order.insert_all(orders)

# Generate 1000 fake attachments
attachments = []
1000.times do
  attachments << { user_id: rand(1..1000),
                   file_path: Faker::File.file_name(dir: '/path/to/files'),
                   status: %w[pending completed failed].sample,
                   created_at: Faker::Time.backward(days: 365),
                   updated_at: Time.now
                  }
end
Attachment.insert_all(attachments)

# Generate 1000 fake order_details
order_details = []
1000.times do
  order_details << { order_id: rand(1..1000),
                     product_id: rand(1..1000),
                     created_at: Faker::Time.backward(days: 365),
                     updated_at: Time.now
                  }
end
OrderDetail.insert_all(order_details)