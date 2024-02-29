# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

### User Order History App
  1. Description
    This is a Rails application that allows users to view their order history and download it as a CSV file.

  2. Features
    1.List users along with their email addresses.
    2.Each user has a "Download" button to download their order history as a CSV file.
    3.Order history includes details such as order ID, product name, quantity, price, etc.

### Installation
  1. Clone the repository:
    `$ git clone <repository-url>`

  2. Navigate to the project directory:
    `$ cd avaamo_app `

  3. Install dependencies:
    `$ bundle install `

  4. Set up the database:
    `$ rails db:create `
    `$ rails db:migrate `

  6. Sidekiq is used for backgroung processing so we should install redis to configure sidekiq.
     `$ install redis `

  7. Run the below command in the project dir to start redis server in backgroung locally
     `$ brew services start redis `

  8. Run the below command in the project dir to run sidekiq server locally
     `$bundle exec sidekiq`

  5. Start the Rails server
      `$ rails server `

### Open your browser and visit http://localhost:3000 to access the application.

### Usage
  1. Currently authentication is not setup for application, so you can directly access it.
  2. Once visit http://localhost:3000/users you will be able to see a list of users along with their email addresses and button to download order history of user.
  3. Click on the "Download" button next to a user to download their order history as a CSV file.

