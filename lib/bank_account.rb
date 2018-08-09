class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  #might have to use method= later
  def deposit(money)
    @balance += money
  end

  def withdraw(money)
    @balance -= money
  end


  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "closed" || self.balance <= 0
      false
    else
      true
    end
  end

  def close_account
    self.status = "closed"
  end

end