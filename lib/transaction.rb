
class Transaction
  attr_reader :date, :type

  def initialize(date, type)
    @date = date
    @type = type
  end 
end 
