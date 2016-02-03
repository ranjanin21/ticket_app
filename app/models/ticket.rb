class Ticket < ActiveRecord::Base
  
  belongs_to :customer
  
  before_create :generate_tickets_number
  before_create :generate_booking_number
 
  def generate_tickets_number
     x = ('A'..'Z').to_a.shuffle.first(3).join
      if x == ("EKA" || "SEL" ||  "BAR" ||"RAC" || "MON" || "ETI" || "AMA")
       self.number_1 = x.reverse
      else
       self.number_1 = x
      end
    a = [*'0'..'9', *'A'..'Z'].to_a.shuffle.first(3).join    
    if Customer.current.tickets.present?
        #to get the booking numbers of tickets cancelled before 3 months
      numbers = Ticket.all.where("cancelled_date < ? OR cancelled_date IS NULL", Date.today-3.months).pluck(:number_2)
      while numbers.include? a.to_s
        a = [*'0'..'9', *'A'..'Z'].shuffle.first(3).join
      end
      self.number_2 = a
    else
      self.number_2 = a
    end
  end
  
  def generate_booking_number
    tickets = Ticket.all.where("journey_date < ?", Date.today-2.years).pluck(:booking_number)
    if tickets.present?
      tickets1 = Ticket.all.where("journey_date >= ?", Date.today-2.years).pluck(:booking_number)
      if tickets1.include? tickets.shuffle.first       
        self.booking_number = self.number_1 + self.number_2.to_s
      else
        self.booking_number = tickets.shuffle.first
      end
    else
      self.booking_number = self.number_1 + self.number_2.to_s
    end
    self.ticket_status = "Confirmed"
  end
  
 
end
