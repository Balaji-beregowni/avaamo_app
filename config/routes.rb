
require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'
  resources  :users,only: [:index] do
    member do
      get 'orders', to: 'orders#download', defaults: { format: 'csv' }
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
    member do
      get 'csv_status'
    end
    collection do
      post 'import'
    end
  end
end
