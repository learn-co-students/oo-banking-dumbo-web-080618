class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    #@sender.status == "open" && @receiver.status == "open"
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    #has_run = false

    #while has_run == false
      if sender.valid? && sender.balance > @amount && @status == 'pending'
        receiver.deposit(@amount)
        sender.balance -= @amount
        @status = "complete"
      else
        @status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      end

  end

  def reverse_transfer
    if @status == 'complete'
      sender.balance += @amount
      receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end
