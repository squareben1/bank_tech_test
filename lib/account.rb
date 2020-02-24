# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    Transaction.new(Time.new.strftime("%d/%m/%Y"), 'credit', amount)
  end

  def withdraw(amount)
    @balance -= amount
  end
end
