
class Transaction
  attr_reader :date, :type, :amount

  def initialize(date, type, amount)
    @date = date
    @type = type
    @amount = amount
  end
end
