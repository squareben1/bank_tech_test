# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0, injected_class=Transaction)
    @balance = balance
    @transactions = []
    @injected_class = injected_class
  end

  def deposit(amount)
    @balance += amount
    new_transaction(amount)
  end

  def new_transaction(amount)
    @transactions.push(@injected_class.create(Time.new.strftime('%d/%m/%Y'), 'credit', amount, @balance))
  end

  def withdraw(amount)
    @balance -= amount
    new_transaction(amount)
  end
end
