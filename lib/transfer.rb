require 'pry'

class Transfer

  attr_accessor :status,:bank_account

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
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    elsif  !(sender.valid?) == false
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    #binding.pry
  if @status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    @status = 'reversed'
  end
  #end

  end
end
