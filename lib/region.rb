class Region
  def initialize(numbers)
    @numbers = numbers.sort
  end

  def valid?
    @numbers.size == @numbers.uniq.size
  end

  def complete?
    return false if @numbers.first != 1
    @numbers.last == @numbers.size
  end
end
