class CustomersController < ApplicationController
  
  def index
  end
  
  def new
    @customer = Customer.new
    @bank_detail = BankDetail.new
    @address = Address.new
    @employment_detail = EmploymentDetail.new
  end
  
  def create
    @customer = Customer.new(set_params)
    if @customer.save
      redirect_to customer_path(@customer.id)
    else
      render action: 'new'
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html
      format.json #{render json: @customer}
      #format.json {  send_data render_to_string(:show), :filename => 'customer location.json', :type=>"application/json", :disposition => 'attachment' }
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
    @customer.address = Address.new
    @customer.bank_detail = BankDetail.new
    @customer.employment_detail = EmploymentDetail.new
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(set_params)
      redirect_to customer_path(@customer.id)
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @customer = Customer.find(params[:id])
  end
  
  private
  def set_params
    params[:customer].permit(:name, :email, :mobile_number,
      {:address_attributes => [:id, :street, :area, :city, :state, :pincode, :latitude, :longitude]},
      {:bank_detail_attributes => [:id, :bank_name, :branch_name, :account_number]},
      {:employment_detail_attributes => [:id, :company_name, :location, :designation]}
      )
  end
end
