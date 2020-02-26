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
      expect(subject.print_balance(['24/02/2020 || credit || 10 || 10', '24/02/2020 || credit || 10 || 10'])).to eq "date || credit || debit || balance\n24/02/2020 || credit || 10 || 10\n24/02/2020 || credit || 10 || 10"
    end

    # xit 'should iterate over multiple transactions in array and print correctly' do
    #   transaction_class = class_double('Transaction')
    #   transaction_instance = instance_double('Transaction', { date: '24/02/2020', type: 'credit', amount: 10, balance: 10 })
    #   allow(transaction_class).to receive(:new).and_return(transaction_instance)
    #   subject = Account.new(0, transaction_class)
    #   subject.deposit(10)
    #   subject.deposit(10)
    #   p subject.transactions[0].amount
    #   expect(subject.print_balance).to eq "date || credit || debit || balance\n24/02/2020 || credit || 10 || 10\n24/02/2020 || credit || 10 || 10"
    # end
  end
end