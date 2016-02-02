class AddColumnToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :from_place, :string
    add_column :tickets, :to_place, :string
  end
end
