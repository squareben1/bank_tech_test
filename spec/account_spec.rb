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

    it 'pushes a new Transaction obj into transactions array' do
      subject.deposit(10)
      expect(subject.transactions[0]).to be_a Transaction
    end

    it 'pushes Transaction obj with type credit into transactions array' do
      subject.deposit(10)
      expect(subject.transactions[0].type).to eq 'credit'
    end

    xit 'returns a new Transaction obj w/ amount set as deposit amount (10)' do
      transaction = subject.deposit(10)
      expect(transaction.amount).to eq 10
    end

    xit 'returns a new Transaction obj w/ amount set as deposit amount (20)' do
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
