class Ticket < ActiveRecord::Base
  
  before_create :generate_tickets_number
  before_create :generate_booking_number
  
  
  
  def generate_tickets_number
    a = ('A'..'Z').to_a.shuffle.first(3).join
    if a == "EKA"
      self.number_1 = a.reverse
    else
      self.number_1 = a
    end    
    self.number_2 = [*'0'..'9', *'A'..'Z'].shuffle.first(3).join
  end
  
  def generate_booking_number
    self.booking_number = self.number_1 + self.number_2.to_s
    self.ticket_status = "Confirmed"
  end
  
 
end
