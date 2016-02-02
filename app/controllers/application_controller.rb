class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  def after_sign_up_path_for(customer)
    return customer_path(current_customer.id)
  end
  
  def after_sign_in_path_for(customer)
    if current_customer.address == nil
      return edit_customer_path(current_customer.id)
    else
      return customer_path(current_customer.id)
    end
  end
  
  def after_sign_out_path_for(customer)
    return new_customer_session_path
  end
  
 
end
