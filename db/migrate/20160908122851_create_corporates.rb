class CreateCorporates < ActiveRecord::Migration
  def change
    create_table :corporates do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
