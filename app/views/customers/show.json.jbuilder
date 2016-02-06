json.customer do 
  json.name @customer.name
  json.city @customer.address.city
  json.latitude @customer.address.latitude
  json.longitude @customer.address.longitude  
end