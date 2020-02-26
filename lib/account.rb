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
    @transactions.push(@injected_class.new(Time.new.strftime('%d/%m/%Y'), type, amount, @balance))
  end

  def print_balance
    string = 'date || credit || debit || balance'
    transaction_strings = ''
    if @transactions.empty?
      string
    else
      @transactions.each do |transaction|
        @new_string = string + "\n#{transaction.date} || #{transaction.type} || #{transaction.amount} || #{transaction.balance}"
      end
      @new_string
      # string + "\n24/02/2020 || credit || 10 || 10"
    end #ADD GEMFILE w simplecov
  end
end
