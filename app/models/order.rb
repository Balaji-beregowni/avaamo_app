class Order < ApplicationRecord
  # table_name - orders
  # columns
  # id                  integer
  # user_id             foreign_key
  # quantity            integer
  # total_price         decimal
  # date_of_purchase    Date
  # shipping_address    text
  # timestamps

  extend DataImportService

  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  validates :date_of_purchase, presence: true
  validates :total_price, presence: true
  validates :shipping_address, presence: true


  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << %w[OrderID Product Quantity Price]
      all.for_each do |order|
        csv << [order.id, order.product.name, order.quantity, order.price]
      end
    end
  end
end

# rails generate migration CreateOrders user:references date_of_purchase:date quantity:integer total_price:decimal{10,2} shipping_address:text