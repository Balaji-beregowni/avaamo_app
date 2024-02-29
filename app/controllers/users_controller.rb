class UsersController < ApplicationController
  def index
    # we can use pagination if there are large number of users
    # we can enhance this application by giving search mechanism
    @users = User.all
  end

  # to import users data through csv
  def import
    User.import_data(file_path)
  end

  def download_orders_csv

    user = User.find(params[:id])

    if user.orders.blank?
      render json: { message: "User is not having orders to download." }
      return
    end
    # for simplicity i stored files in public folder
    # in real time we can store in database or some cloud services(Amazon S3)
    file_path = "public/#{user.username}_orders.csv"
    attachment = user.attachments.create(file_path: file_path, status: 'pending')
    return "Failed to create attachment record" unless attachment
    OrdersCsvDownloadWorker.perform_async(user_id: user.id, attachment_id: attachment.id)

    render json: {
      message: "CSV download for #{user.username} started.",
      attachment_id: attachment.id
    }
  end

  private

  def order_params
    params.permit(:file_path)
  end

end