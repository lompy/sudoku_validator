require 'rspec'
require_relative '../lib/region.rb'

describe Region, '#valid?' do
  subject { Region.new(numbers) }

  context 'without repeating numbers and any number of zeros' do
    let(:numbers) { [0, 0, 2, 3] }
    it { is_expected.to be_valid }
  end

  context 'with repeating numbers' do
    let(:numbers) { [0, 0, 2, 2] }
    it { is_expected.not_to be_valid }
  end

  context 'with any number grater then array arity' do
    let(:numbers) { [1234, 0, 0, 0] }
    it { is_expected.not_to be_valid }
  end
end

describe Region, '#complete?' do
  subject { Region.new(numbers) }

  context 'with any number of 0' do
    let(:numbers) { [0, 3, 2] }
    it { is_expected.not_to be_complete }
  end

  context 'without zeros with skipped numbers' do
    let(:numbers) { [2, 3, 5, 4] }
    it { is_expected.not_to be_complete }
  end

  context 'without zeros without skipped numbers' do
    let(:numbers) { [3, 2, 1] }
    it { is_expected.to be_complete }
  end
end
