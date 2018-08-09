require 'pry'

class Transfer

  attr_accessor :status

  def initialize(person_1,person_2,amount)
    @person_1 = person_1
    @person_2 = person_2
    @amount  = amount
    @status = 'pending'
  end
  def sender
    @person_1
  end

  def receiver
    @person_2
  end
  def amount
    @amount
  end

  def valid?
    if sender.status == 'open'  && receiver.status == 'open'
      true
    else
      false
    end
  end 
end
