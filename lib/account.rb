# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    new_transaction(amount)
  end

  def new_transaction(amount)
    @transactions.push(Transaction.new(Time.new.strftime('%d/%m/%Y'), 'credit', amount, @balance))
  end

  def withdraw(amount)
    @balance -= amount
  end
end
