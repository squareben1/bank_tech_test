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

    it 'pushes Transaction obj with correct attributes into transactions array' do
      subject.deposit(10)
      expect(subject.transactions[0].type).to eq 'credit'
      expect(subject.transactions[0].amount).to eq 10
      expect(subject.transactions[0].date).to eq Time.new.strftime('%d/%m/%Y')
      expect(subject.transactions[0].balance).to eq subject.balance
    end

    it 'transaction objs are pushed into array with correct balances at time each one is created' do
      subject.deposit(10)
      expect(subject.transactions[0].balance).to eq 10
      subject.deposit(20)
      expect(subject.transactions[1].balance).to eq 30
    end

    it 'returns a new Transaction obj w/ amount set as deposit amount (10)' do
      transaction = subject.deposit(10)
      expect(subject.transactions[0].amount).to eq 10
    end

    it 'returns a new Transaction obj w/ amount set as deposit amount (20)' do
      subject.deposit(20)
      expect(subject.transactions[0].amount).to eq 20
    end
  end

  describe '#new_transaction' do 
    it 'should push new transaction w/ specified amount into transactions array' do 
      subject.new_transaction(10)
      expect(subject.transactions[0].amount).to eq 10
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
