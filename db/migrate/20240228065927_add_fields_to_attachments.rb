class AddFieldsToAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :file_path
      t.string :status
      t.timestamps
    end
  end
end
