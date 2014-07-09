class Sudoku
  def initialize(string)
    @lines = string.split("\n").select{ |l| l =~ /^\s*\d/ }.map do |l|
      l.sub('|','').split.map(&:to_i)
    end
  end

  def valid?
    
  end
end
