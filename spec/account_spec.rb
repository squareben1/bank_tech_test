require 'account'

describe Account do
  it 'has a starting, default balance of zero' do
    expect(subject.balance).to eq 0
  end

  describe '#deposit' do
    it 'adds 10 to balance' do
      subject.deposit(10)
      expect(subject.balance).to eq 10
    end
  end
end
