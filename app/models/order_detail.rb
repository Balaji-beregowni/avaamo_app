class OrderDetail < ApplicationRecord
  # table_name - order_details
  # id            integer
  # product_id    foreign_key
  # order_id      foreign_key
  # timestamps
  
  belongs_to :order
  belongs_to :product
end