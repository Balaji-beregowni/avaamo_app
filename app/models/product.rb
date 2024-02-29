class Product < ApplicationRecord
  # table_name - products
  # columns
  # id             "integer"
  # code           "string"
  # name           "string"
  # category       "string"
  # timestamps

  extend DataImportService

  has_many :order_items
  has_many :orders, through: :order_items

  validates :code, presence: true

  validates_uniqueness_of :code, presence: true
end