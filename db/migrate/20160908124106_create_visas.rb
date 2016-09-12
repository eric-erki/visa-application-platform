class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :country_abbr
      t.integer :visa_type
      t.text :note
      t.integer :applicant_id

      t.timestamps null: false
    end
  end
end
