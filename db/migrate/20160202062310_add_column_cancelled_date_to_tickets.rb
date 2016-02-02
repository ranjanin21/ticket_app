class AddColumnCancelledDateToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :cancelled_date, :date
  end
end
