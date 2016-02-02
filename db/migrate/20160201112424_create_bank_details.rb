class CreateBankDetails < ActiveRecord::Migration
  def change
    create_table :bank_details do |t|
      t.string :bank_name
      t.string :branch_name
      t.string :account_number
      t.timestamps null: false
    end
  end
end
