class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    p "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    elsif @status == "closed"
      false
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

  def self.all
    @@all
  end

end
