class OrdersController < ApplicationController

   # to import orders data through csv
  def import
    Order.import_data(params[:file_path])
  end

  private

  def order_params
    params.permit(:file_path)
  end
end