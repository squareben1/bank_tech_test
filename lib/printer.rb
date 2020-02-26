# frozen_string_literal: true

class Printer
  def initialize(account = Account)
    @account = account
  end

  def stringify_transactions(transactions)
    array = []

    transactions.each do |transaction|
      if transaction.type == 'credit'
        array.push("#{transaction.date} || #{transaction.amount} || || #{transaction.balance}")
      else
        array.push("#{transaction.date} || || #{transaction.amount} || #{transaction.balance}")
      end
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
