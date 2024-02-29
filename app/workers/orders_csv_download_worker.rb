class OrdersCsvDownloadWorker
  include Sidekiq::Worker

  def perform(options = {})
    options = options = options.with_indifferent_access
    user = User.find(options[:user_id])
    orders = user.orders
    csv_data = generate_csv_data(orders)
    attachment = Attachment.find(options[:attachment_id])
    file_path = attachment.file_path
    File.open(file_path, 'w') { |f| f.write(csv_data) }
    attachment.update(status: 'completed')
  rescue => error
    Rails.logger.info("An error occurred while generating file - #{error}")
    attachment.update(status: 'failed')
  end

  private

  def generate_csv_data(orders)
    CSV.generate do |csv|
      csv << ['Order ID','Quantity', 'Total Price', 'Date', 'Address']
      orders.each do |order|
        csv << [order.id, order.quantity, order.total_price, order.date_of_purchase, order.shipping_address]
      end
    end
  end
end