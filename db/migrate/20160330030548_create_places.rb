class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :address
      t.integer :zip
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
