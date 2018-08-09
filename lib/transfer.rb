class Transfer
  # your code here
  require 'pry'
 # your code here
 attr_reader :sender, :receiver, :amount
 attr_accessor :status

 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end

 def valid?
   if @sender.valid? == true && @receiver.valid? == true
     true
   else
     false
   end
 end

 def execute_transaction
   if self.valid? == true && self.status == "pending" && self.sender.balance >= self.amount
     @sender.withdraw(@amount)
     @receiver.deposit(@amount)
     self.status = "complete"
   else
     self.status = "rejected"
     return "Transaction rejected. Please check your account balance."#
   end
 end

 def reverse_transfer
   if self.status == "complete"
     @sender.deposit(@amount)
     @receiver.withdraw(@amount)
     self.status = "reversed"
   end
 end
end
