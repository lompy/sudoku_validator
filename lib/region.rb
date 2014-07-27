class Region
  def initialize(numbers)
    @numbers = numbers
  end

  def valid?
    non_zeros = @numbers.reject(&:zero?)
    non_zeros.size == non_zeros.uniq.size && non_zeros.max <= @numbers.size
  end

  def complete?
    !@numbers.include?(0) && @numbers.max <= @numbers.size
  end
end
