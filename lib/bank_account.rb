class BankAccount

  attr_reader :name
  attr_accessor :balance, :status


  def initialize(name, balance= 1000, status = "open")
    @name = name
    @balance = balance
    @status = status



end
def balance=(amount)
  @balance = amount
end

def deposit(num)
  @balance += num



end
def display_balance
  "Your balance is $#{@balance}."


end
def status=(status)
  @status = status
end

def valid?
  @status == "open" && @balance > 0
end
def close_account
  @status = "closed"


end




end
