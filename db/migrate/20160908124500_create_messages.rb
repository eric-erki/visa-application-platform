class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :applicant_id
      t.integer :already_read
      t.timestamps null: false
    end
  end
end
