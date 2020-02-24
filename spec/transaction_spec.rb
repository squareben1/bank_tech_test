# frozen_string_literal: true

require 'transaction'

describe Transaction do
  time = Time.new
   
  transaction = Transaction.new(time.strftime("%d/%m/%Y"), 'Deposit', 10)

  it 'should set date of transaction as attr from arg' do
    expect(transaction.date).to eq time.strftime("%d/%m/%Y")
  end

  it 'should set type of transaction as attr from arg' do
    expect(transaction.type).to eq 'Deposit'
  end

  it 'should set amount of transaction as attr from arg' do
    expect(transaction.amount).to eq 10
  end
end
