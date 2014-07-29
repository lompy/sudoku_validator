require 'rspec'
require_relative '../lib/sudoku_validator'

describe SudokuValidator, '#validate' do
  subject { SudokuValidator.new(sudoku).validate }

  context 'valid, complete sudoku' do
    let(:sudoku) { double("sudoku", valid?: true, complete?: true) }
    it { is_expected.to eq "This sudoku is valid" }
  end
  context 'valid, incomplete sudoku' do
    let(:sudoku) { double("sudoku", valid?: true, complete?: false) }
    it { is_expected.to eq "This sudoku is valid, but incomplete" }
  end
  context 'invalid, incomplete sudoku' do
    let(:sudoku) { double("sudoku", valid?: false, complete?: false) }
    it { is_expected.to eq "This sudoku is invalid" }
  end
  context 'invalid, complete sudoku' do
    let(:sudoku) { double("sudoku", valid?: false, complete?: true) }
    it { is_expected.to eq "This sudoku is invalid" }
  end
end

describe SudokuValidator, '#validate' do
  def message(sudoku)
    SudokuValidator.new(sudoku).validate
  end

  context 'valid, complete sudoku' do
    specify do
      sudoku = double('', valid?: true, complete?: true)
      expect(message(sudoku)).to eq "This sudoku is valid" 
    end
  end
  context 'valid, incomplete sudoku' do
    specify do
      sudoku = double("sudoku", valid?: true, complete?: false)
      expect(message(sudoku)).to eq "This sudoku is valid, but incomplete"
    end
  end
  context 'invalid, incomplete sudoku' do
    specify do
      sudoku = double("sudoku", valid?: false, complete?: false)
      expect(message(sudoku)).to eq "This sudoku is invalid"
    end
  end
  context 'invalid, complete sudoku' do
    specify do
      sudoku = double("sudoku", valid?: false, complete?: false)
      expect(message(sudoku)).to eq "This sudoku is invalid"
    end
  end
end
