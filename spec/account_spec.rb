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

    it 'returns a new Transaction obj w/ amount set as deposit amount (10)' do
      transaction_class = class_double('Transaction')
      transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
      allow(transaction_class).to receive(:new).and_return(transaction_instance)
      subject = Account.new(0, transaction_class)
      subject.deposit(10)
      expect(subject.transactions[0].amount).to eq 10
    end
  end

  describe '#new_transaction' do
    it 'should push new transaction into array' do
      transaction_class = class_double('Transaction')
      transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
      allow(transaction_class).to receive(:new).and_return(transaction_instance)
      subject = Account.new(0, transaction_class)

      subject.new_transaction(10, 'credit')
      expect(subject.transactions[0].amount).to eq 10
    end

    it 'should push new transaction w/ specified amount into array' do
      transaction_class = class_double('Transaction')
      transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
      allow(transaction_class).to receive(:new).and_return(transaction_instance)
      subject = Account.new(0, transaction_class)

      subject.new_transaction(10, 'credit')
      expect(subject.transactions[0].type).to eq 'credit'
    end
  end

  describe '#withdraw' do
    it 'subtracts 10 from balance' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.balance).to eq 0
    end

    it 'throws an error when balance is less than withdrawal amount' do
      expect { subject.withdraw(10) }.to raise_error 'Insufficient funds available'
    end
  end
end
