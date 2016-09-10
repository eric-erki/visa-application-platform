class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.text :domain
      t.integer :corporate_id

      t.timestamps null: false
    end
  end
end
