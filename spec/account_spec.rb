# frozen_string_literal: true

require 'account'

describe Account do
  it 'has a starting, default balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'has empty transactions array' do 
    expect(subject.transactions).to eq []
  end

  describe '#deposit' do
    it 'adds 10 to balance' do
      subject.deposit(10)
      expect(subject.balance).to eq 10
    end

    it 'returns a new Transaction obj' do
      expect(subject.deposit(10)).to be_a Transaction
    end

    it 'return Transaction obj with type credit' do
      transaction = subject.deposit(10)
      expect(transaction.type).to eq 'credit'
    end

    it 'returns a new Transaction obj w/ amount set as deposit amount (10)' do
      transaction = subject.deposit(10)
      expect(transaction.amount).to eq 10
    end

    it 'returns a new Transaction obj w/ amount set as deposit amount (20)' do
      transaction = subject.deposit(20)
      expect(transaction.amount).to eq 20
    end
  end

  describe '#withdraw' do
    it 'subtracts 10 from balance' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.balance).to eq 0
    end
  end
end
