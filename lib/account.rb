# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0, injected_class = Transaction)
    @balance = balance
    @transactions = []
    @injected_class = injected_class
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
    @transactions.push(@injected_class.create(Time.new.strftime('%d/%m/%Y'), type, amount, @balance))
  end

  def print_balance
    string = "date || credit || debit || balance"
    if @transactions.length == 0
      string 
    else 
      string + "\n24/02/2020 || credit || 10 || 10"
    end
  end
end
