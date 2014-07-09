require 'rspec'
require_relative '../lib/sudoku.rb'

describe Sudoku, '#valid?' do
  context 'invalid raw string' do
    let(:raw_sudoku) { File.open('invalid_complete.sudoku').read }
    specify { expect(Sudoku.new(raw_sudoku)).not_to be_valid }
  end

  context 'valid raw string' do
    let(:raw_sudoku) { File.open('valid_complete.sudoku').read }
    specify { expect(Sudoku.new(raw_sudoku)).to be_valid }
  end
end
