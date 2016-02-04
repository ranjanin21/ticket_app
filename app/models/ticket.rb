class Ticket < ActiveRecord::Base
  
  belongs_to :customer
  
  before_create :generate_tickets_number
 # before_create :generate_booking_number
 before_create :check_cancelled_date

  
  def generate_tickets_number
    a = ('A'..'Z').to_a.shuffle.first(3).join
    self.number_1 = a
    b = [*'0'..'9', *'A'..'Z'].to_a.shuffle.first(3).join   
    self.number_2 = b
  end
  
  def check_cancelled_date
    reference_number = self.number_1 + self.number_2.to_s
    if Ticket.any?
      ticket_numbers = Ticket.all.pluck(:booking_number)
      if ticket_numbers.include? reference_number
        ticket = Ticket.where(:booking_number => reference_number).first
        ticket_status = ticket.ticket_status
         if ticket_status == "Cancelled"
           if ticket.cancelled_date < Date.today - 3.months
             self.booking_number = reference_number
           else
             need to generate new ticket number, check all conditions
           end
         else
           need to generate new ticket number, check all conditions
         end
      else
        self.booking_number = reference_number
      end
    else
     self.booking_number = reference_number
    end
    self.ticket_status = "Confirmed"
  end
    
  
=begin

    
  
  def check_journey_date
     if ticket.journey_date < Date.today - 2.years
       self.booking_number = reference_number
     else
       self.booking_number = "ABCneww number"
     end
  end


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
=end
   
end
