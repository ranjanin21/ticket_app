class Address < ActiveRecord::Base
  geocoded_by :city
  after_validation :geocode
  
  belongs_to :customer
end
