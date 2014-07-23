require 'rspec'
require_relative '../lib/sudoku_parser'

describe SudokuParser, '#parse' do
  context 'valid complete sudoku' do
    let(:data) do 
      <<-END.gsub(/^ {6}/, '')
        8 5 . |. . 2 |4 . . 
        7 2 . |. . . |. . 9 
        . . 4 |. . . |. . . 
        ------+------+------
        . . . |1 . 7 |. . 2 
        3 . 5 |. . . |9 . . 
        . 4 . |. . . |. . . 
        ------+------+------
        . . . |. 8 . |. 7 . 
        . 1 7 |. . . |. . . 
        . . . |. 3 6 |. 4 . 
      END
    end

    it 'returns 27 regions' do
      regions = SudokuParser.new(data).parse
      expect(regions.size).to eq 27
    end

    it 'returned regions are valid and incomplete' do
      regions = SudokuParser.new(data).parse
      regions.each do |r|
        expect(r).to be_valid
        expect(r).not_to be_complete
      end
    end
  end
end
