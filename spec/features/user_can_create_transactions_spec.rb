require 'account'

describe Account do
  it 'pushes Transaction obj with correct attrs into transactions array' do
    subject.deposit(10)
    expect(subject.transactions[0].type).to eq 'credit'
    expect(subject.transactions[0].amount).to eq 10
    expect(subject.transactions[0].date).to eq Time.new.strftime('%d/%m/%Y')
    expect(subject.transactions[0].balance).to eq subject.balance
  end
end