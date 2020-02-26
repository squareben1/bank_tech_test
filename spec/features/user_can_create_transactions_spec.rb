# frozen_string_literal: true

require 'account'

describe Account do
  describe '#deposit interacts correctly w Transaction class' do
    it 'pushes a new class obj into transactions array' do
      subject.deposit(10)
      expect(subject.transactions[0]).to be_a Transaction
    end

    it 'pushes Transaction obj with correct attrs into transactions array' do
      subject.deposit(10)
      expect(subject.transactions[0].type).to eq 'credit'
      expect(subject.transactions[0].amount).to eq 10
      expect(subject.transactions[0].date).to eq Time.new.strftime('%d/%m/%Y')
      expect(subject.transactions[0].balance).to eq subject.balance
    end

    it 'each transaction obj pushed into array with correct balance at time' do
      subject.deposit(10)
      expect(subject.transactions[0].balance).to eq 10
      subject.deposit(20)
      expect(subject.transactions[1].balance).to eq 30
    end
  end
  describe '#withdraw interatcs correctly w Transaction class' do
    it 'pushes a new Transaction obj into transactions array' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.transactions[1]).to be_a Transaction
    end

    it 'each transaction obj pushed into array with correct balance at time' do
      subject.deposit(30)
      subject.withdraw(10)
      expect(subject.transactions[1].balance).to eq 20
      subject.withdraw(10)
      expect(subject.transactions[2].balance).to eq 10
    end

    it 'pushes Transaction obj with correct attrs into transactions array' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.transactions[1].type).to eq 'debit'
    end
  end
end
