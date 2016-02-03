class AddColumnJourneyDateToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :journey_date, :date
  end
end
