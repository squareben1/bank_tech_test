require 'printer'

describe Printer do
  describe '#print_balance' do
    it 'should return headings only when no transactions present' do
      expect(subject.print_balance('')).to eq "date || credit || debit || balance\n"
    end

    it 'should return headings and 1 deposit as string w attrs seperated by ||' do
      expect(subject.print_balance('24/02/2020 || credit || 10 || 10')).to eq "date || credit || debit || balance\n24/02/2020 || credit || 10 || 10\n"
    end


  end
end