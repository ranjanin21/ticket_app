class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :area
      t.string :city
      t.string :state
      t.string :pincode
      t.timestamps null: false
    end
  end
end
