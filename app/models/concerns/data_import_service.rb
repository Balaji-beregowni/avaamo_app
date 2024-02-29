require 'csv'
module DataImportService
  extend ActiveSupport::Concern

  # activerecord-import sanitizes rows before inserting to avoid SQL injection vulnerabilities.
  def import_data(file_path)
    rows = CSV.read(file_path, headers: true)
    data = rows.map(&:to_hash)
    begin
      self.import(data, validate: true) # Triggers validations during import
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error "Validation failed during import: #{e.message}"
    end
  end
end