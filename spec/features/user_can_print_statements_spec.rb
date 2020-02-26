# frozen_string_literal: true

require 'printer'
require 'account'

describe Printer do
  it 'prints single transaction from account' do
    account = Account.new
    account.deposit(10)
    printer = Printer.new
    # p "transactions: #{account.transactions}"
    # p "stringify: #{printer.stringify_transactions(account.transactions)}"
    # p "print: #{printer.print_balance(printer.stringify_transactions(account.transactions))}"
    expect(printer.print_balance(printer.stringify_transactions(account.transactions))).to eq "date || credit || debit || balance\n26/02/2020 || 10 || || 10"
  end

  it 'prints two transactions from account, a credit and a debit' do
    account = Account.new
    account.deposit(10)
    account.withdraw(10)
    printer = Printer.new
    expect(printer.print_balance(printer.stringify_transactions(account.transactions))).to eq "date || credit || debit || balance\n26/02/2020 || 10 || || 10\n26/02/2020 || || 10 || 0"
  end
end

