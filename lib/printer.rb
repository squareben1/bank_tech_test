# frozen_string_literal: true

class Printer

  def initialize(account=Account)
    @account = account
  end

  def print_balance(transactions)
    string = "date || credit || debit || balance\n"
    # transaction_strings = ''
    # if @transactions.empty?
    #   string
    # else
    #   @transactions.each do |transaction|
    #     @new_string = string + "\n#{transaction.date} || #{transaction.type} || #{transaction.amount} || #{transaction.balance}"
    #   end
    #   @new_string
    #   # string + "\n24/02/2020 || credit || 10 || 10"
    # end
  end
end 