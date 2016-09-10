class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :passport_number
      t.string :phone_number
      t.string :mail_address

      t.timestamps null: false
    end
  end
end
