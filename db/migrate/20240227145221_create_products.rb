class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :category
      t.timestamps
    end
  end
end
