# frozen_string_literal: true

class Printer

  def initialize(account=Account)
    @account = account
  end

  def stringify_transactions(transactions)
    array = []
    transactions.each do |transaction|
      array.push("#{transaction.date} || #{transaction.type} || #{transaction.amount} || #{transaction.balance}")
    end
    array
  end 

  def print_balance(transactions)
    string = "date || credit || debit || balance\n"
    if transactions[0] == ''
      string
    else
      string + transactions.join("\n")
    end
  end
end 