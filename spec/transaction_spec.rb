# frozen_string_literal: true

require 'transaction'

describe Transaction do
  transaction = Transaction.new(12 / 0o2 / 2020, 'Deposit', 10)

  it 'should set date of transaction as attr from arg' do
    expect(transaction.date).to eq 12 / 0o2 / 2020
  end

  it 'should set type of transaction as attr from arg' do
    expect(transaction.type).to eq 'Deposit'
  end

  it 'should set amount of transaction as attr from arg' do
    expect(transaction.amount).to eq 10
  end
end
