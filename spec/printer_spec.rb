# frozen_string_literal: true

require 'printer'

describe Printer do
  describe '#print_balance' do
    it 'should return heading only when no transactions present' do
      expect(subject.print_balance([''])).to eq "date || credit || debit || balance\n"
    end

    it 'should return heading and 1 deposit as string w attrs seperated by ||' do
      expect(subject.print_balance(['24/02/2020 || credit || 10 || 10'])).to eq "date || credit || debit || balance\n24/02/2020 || credit || 10 || 10"
    end

    it 'should return heading and 1 deposit as string w attrs seperated by ||' do
      p subject.print_balance(['24/02/2020 || credit || 10 || 10', '24/02/2020 || credit || 10 || 10'])
      expect(subject.print_balance(['24/02/2020 || credit || 10 || 10', '24/02/2020 || credit || 10 || 10'])).to eq "date || credit || debit || balance\n24/02/2020 || credit || 10 || 10\n24/02/2020 || credit || 10 || 10"
    end
  end

  describe '#stringify_transactions' do
    it 'returns array with one credit string based on attributes of array of class obj passed in' do
      transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
      expect(subject.stringify_transactions([transaction_instance])).to eq ['24/02/2020 || 10 || || 10']
    end

    it 'returns array with 2 strings based on attrs of 2 objs of same type' do
      transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
      transaction_instance_2 = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
      expect(subject.stringify_transactions([transaction_instance, transaction_instance_2])).to eq ['24/02/2020 || 10 || || 10', '24/02/2020 || 10 || || 10']
    end

    it 'creates different strings for debits' do
      transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'debit', amount: 10, balance: 10 })
      expect(subject.stringify_transactions([transaction_instance])).to eq ['24/02/2020 || || 10 || 10']
    end

    it 'returns array with 2 strings based on attrs of 2 objs, one credit and 1 debit' do
      transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
      transaction_instance_2 = instance_double('Transaction', { date: '24/02/2020', type: 'debit', amount: 10, balance: 10 })
      expect(subject.stringify_transactions([transaction_instance, transaction_instance_2])).to eq ['24/02/2020 || 10 || || 10', '24/02/2020 || || 10 || 10']
    end
  end
end
