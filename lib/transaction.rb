# frozen_string_literal: true

class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(date, type, amount, balance)
    @date = date
    @type = type
    @amount = amount
    @balance = balance
  end

  def self.create(date, type, amount, balance)
    Transaction.new(date, type, amount, balance)
  end
end
