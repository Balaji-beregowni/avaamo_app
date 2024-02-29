class User < ApplicationRecord
  # table_name - users
  # columns
  # username    "string"
  # email       "string"
  # phone       "string"
  # timestamps

  extend DataImportService

  has_many :orders, dependent: :destroy
  has_many :attachments, dependent: :destroy

  validates_presence_of :username
  validates_uniqueness_of :email, presence: true
  validates :email, presence: true,format: {
    with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "is not a valid email address"
  }
  before_validation :ensure_downcase_email

  # Returns a lowercase email address.
  def ensure_downcase_email
    self.email = email&.downcase
  end
end