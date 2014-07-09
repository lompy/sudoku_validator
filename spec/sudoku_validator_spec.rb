require 'rspec'
require_relative '../lib/sudoku_validator'

describe SudokuValidator, '#validate' do
  context 'valid, complete sudoku' do
    let(:sudoku) { double("sudoku", :valid? => true, :complete? => true) }
    specify do
      expect(SudokuValidator.new(sudoku).validate).to eq "This sudoku is valid" 
    end
  end

  context 'valid, incomplete sudoku' do
    let(:sudoku) { double("sudoku", :valid? => true, :complete? => false) }
    specify do
      expect(SudokuValidator.new(sudoku).validate).to eq "This sudoku is valid, but incomplete" 
    end
  end

  context 'invalid sudoku' do
    let(:sudoku) { double("sudoku", :valid? => false) }
    specify do
      expect(SudokuValidator.new(sudoku).validate).to eq "This sudoku is invalid" 
    end
  end
end
