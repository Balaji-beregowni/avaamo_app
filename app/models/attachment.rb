class Attachment < ApplicationRecord
  # table_name - attachments
  # columns
  # user_id       foreign_key
  # file_path     "string"
  # status        "string"
  # timestamps
  
  validates_presence_of :file_path
  VALID_STATUSES = %w[pending completed failed].freeze
  validates :status, inclusion: { in: VALID_STATUSES }

end