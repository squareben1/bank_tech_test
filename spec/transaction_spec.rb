require 'transaction'

describe Transaction do 
  it 'should set date of transaction as attr from arg' do 
    transaction = Transaction.new(12/02/2020)
    expect(transaction.date).to eq 12/02/2020
  end 
end