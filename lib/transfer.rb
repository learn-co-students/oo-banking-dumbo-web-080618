class Transfer

 attr_reader :sender, :receiver, :amount
 attr_accessor :status

 def initialize (sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end

 def valid?
   sender.valid? and receiver.valid?
 end

 def execute_transaction
   if valid? && amount <= sender.balance
     if status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
     end
   else
     self.status = "rejected"
     return "Transaction rejected. Please check your account balance."
   end
 end

 def reverse_transfer
   if status == "complete"
     receiver.balance -= amount
     sender.balance += amount
     self.status = "reversed"
   end
 end
end
