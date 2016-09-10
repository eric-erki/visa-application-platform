class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :status_code
      t.text :note
      t.integer :visa_id

      t.timestamps null: false
    end
  end
end
