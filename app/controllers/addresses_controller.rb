class AddressesController < ApplicationController
  
  def index
  end
  
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.new(set_params)
    if @address.save
      redirect_to customer_path
        else
      render action: 'new'
    end
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(set_params)
      redirect_to customer_path
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
  end
  
  private
  def set_params
    params[:address].permit(:street, :area, :city, :state, :pincode, :latitude, :longitude)
  end
  
end
