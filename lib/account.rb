# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0, transaction = Transaction)
    @balance = balance
    @transactions = []
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    new_transaction(amount, 'credit')
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
      new_transaction(amount, 'debit')
    else
      raise 'Insufficient funds available'
    end
  end

  def new_transaction(amount, type)
    @transactions.push(@transaction.new(Time.new.strftime('%d/%m/%Y'), type, amount, @balance))
  end
end
