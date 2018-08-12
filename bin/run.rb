require_relative '../lib/bank_account.rb'
require_relative '../lib/transfer.rb'
require 'pry'

chris = BankAccount.new("chris")
karla = BankAccount.new("karla")
transfer = Transfer.new(karla, chris, 5)
chris.deposit(1000)





binding.pry
0
