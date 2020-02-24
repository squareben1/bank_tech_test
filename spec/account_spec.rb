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
  end

  describe '#withdraw' do
    it 'subtracts 10 from balance' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.balance).to eq 0
    end
  end
end
