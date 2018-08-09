class Transfer
  # your code here
  attr_reader :status
  attr_accessor :sender, :receiver, :amount
#                Felix = BankAccount.new(), Malcome, 10
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount #hoe much the sender is sending
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @status == 'pending' && @sender.balance >= @amount
      @sender.balance -= @amount #@sender.balance = @sender.balance - @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end
