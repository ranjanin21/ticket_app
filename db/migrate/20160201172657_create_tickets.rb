class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :number_1
      t.string :number_2
      t.string :booking_number
      t.date :booking_date
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
