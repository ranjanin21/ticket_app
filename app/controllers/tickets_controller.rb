class TicketsController < ApplicationController
  
  def index
    @tickets = Ticket.where(:customer_id => current_customer.id)
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(set_params)
    if @ticket.save
      redirect_to ticket_path(@ticket.id)
    else
      render action: 'new'
    end
  end
  
  def show
    @ticket = Ticket.find(params[:id])
  end
  
  def edit
    @ticket = Ticket.find(params[:id])
  end
  
  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(set_params)
      redirect_to ticket_path(@ticket.id)
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
  end
  
  def cancel
    @ticket = Ticket.find(params[:id])
    @ticket.update_attribute(:ticket_status, "Cancelled")
    @ticket.update_attribute(:cancelled_date, "#{Date.today}")
    redirect_to tickets_path
  end
  
  private
  def set_params
    params[:ticket].permit(:from_place, :to_place, :booking_date, :customer_id, :ticket_status)
  end
  
  
end
