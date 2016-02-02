class BankDetailsController < ApplicationController
  def index
  end
  
  def new
    @bank_detail = BankDetail.new
  end
  
  def create
    @bank_detail = BankDetail.new(set_params)
    if @bank_detail.save
      redirect_to customer_path
        else
      render action: 'new'
    end
  end
  
  def show
    @bank_detail = BankDetail.find(params[:id])
  end
  
  def edit
    @bank_detail = BankDetail.find(params[:id])
  end
  
  def update
    @bank_detail = BankDetail.find(params[:id])
    if @bank_detail.update_attributes(set_params)
      redirect_to customer_path
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @bank_detail = BankDetailfind(params[:id])
  end
  
  private
  def set_params
    params[:bank_detail].permit(:bank_name, :branch_name, :account_number)
  end
  
end
