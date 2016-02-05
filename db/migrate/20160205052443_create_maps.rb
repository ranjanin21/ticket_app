class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :city
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
