module Api
  class ProductsController < ApplicationController

   # to import products data through csv
    def import
      Product.import_data(file_path)
    end

    private

    def order_params
      params.permit(:file_path)
    end
  end
end