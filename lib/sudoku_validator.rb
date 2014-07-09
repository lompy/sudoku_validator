class SudokuValidator
  def initialize(sudoku)
    @sudoku = sudoku
  end

  def validate
    if @sudoku.valid?
      if @sudoku.complete?
        "This sudoku is valid"
      else
        "This sudoku is valid, but incomplete"
      end
    else
      "This sudoku is invalid"
    end
  end
end
