class AddColumnToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :customer_id, :integer
    add_column :bank_details, :customer_id, :integer
    add_column :employment_details, :customer_id, :integer
  end
end
