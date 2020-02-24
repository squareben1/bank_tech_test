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
    new_transaction(amount, 'credit')
  end

  def withdraw(amount)
    @balance -= amount
    new_transaction(amount, 'debit')
  end

  def new_transaction(amount, type)
    @transactions.push(@injected_class.create(Time.new.strftime('%d/%m/%Y'), type, amount, @balance))
  end
end
