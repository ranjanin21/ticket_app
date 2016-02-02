class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :address
  has_one :bank_detail
  has_one :employment_detail
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :bank_detail
  accepts_nested_attributes_for :employment_detail
end
