
require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    resources  :users,only: [:index] do
      member do
        post 'download_orders_csv'
      end
      collection do
        post 'import'
      end
    end

    resources  :products,only: [:index] do
      collection do
        post 'import'
      end
    end

    resources  :attachments,only: [:index] do
      member do
        get 'csv_status'
      end
    end

    resources  :orders do
      collection do
        post 'import'
      end
    end
  end
end

