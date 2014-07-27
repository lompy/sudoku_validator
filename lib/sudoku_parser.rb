require_relative './region'

class SudokuParser
  def initialize(data)
    @data    = data
    @lines   = []
    @columns = []
    @squares = []
  end

  def parse
    line_index = 0
    @data.each_line do |line|
      if line =~ /.*\d/
        line = line.gsub('|','').split.map(&:to_i)
        @lines[line_index] = line
        parse_line(line, line_index)
        line_index += 1
      end
    end
    get_regions
  end

  private

  def parse_line(line, line_index)
    line.each_with_index do |number, column_index|
      populate_columns(number, line_index, column_index)
      populate_squares(number, line_index, column_index)
    end
  end

  def populate_columns(number, line_index, column_index)
    @columns[column_index] ||= []
    @columns[column_index][line_index] = number
  end

  def populate_squares(number, line_index, column_index)
    outer_index = outer_square_index(line_index, column_index)
    inner_index = inner_square_index(line_index, column_index)
    @squares[outer_index] ||= []
    @squares[outer_index][inner_index] = number
  end

  def outer_square_index(line_index, column_index)
    (line_index / 3) + (column_index / 3) * 3
  end

  def inner_square_index(line_index, column_index)
    (line_index % 3) + (column_index % 3) * 3
  end

  def get_regions
    (@lines + @columns + @squares).map { |a| Region.new(a) }
  end
end
