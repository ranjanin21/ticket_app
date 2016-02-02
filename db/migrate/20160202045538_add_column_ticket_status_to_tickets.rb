class AddColumnTicketStatusToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :ticket_status, :string
  end
end
