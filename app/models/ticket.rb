class Ticket < ActiveRecord::Base
  
  belongs_to :customer
  
  before_create :generate_tickets_number
  before_create :generate_booking_number
 
  def generate_tickets_number
    a = ('A'..'Z').to_a.shuffle.first(3).join
    if Customer.current.tickets.present?
      #to get the booking numbers of tickets cancelled before 3 months
      numbers = Ticket.where("cancelled_date = ? OR cancelled_date < ?", nil, Date.today-3.months).pluck(:number_1)
      if numbers.include? a
        b = [*'A'..'D', *'F'..'Z'].shuffle.first(3).join
        self.number_1 = b
      else
        self.number_1 = a
      end    
    else
      a = ('A'..'Z').to_a.shuffle.first(3).join
      if a == "EKA"
       self.number_1 = a.reverse
      else
       self.number_1 = a
      end
    end
    self.number_2 = [*'0'..'9', *'A'..'Z'].shuffle.first(3).join
  end
  
  def generate_booking_number
    self.booking_number = self.number_1 + self.number_2.to_s
    self.ticket_status = "Confirmed"
  end
  
 
end
