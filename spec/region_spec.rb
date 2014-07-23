require 'rspec'
require_relative '../lib/region.rb'

describe Region, '#valid?' do
  subject { Region.new(numbers) }

  context 'with repeating numbers' do
    let(:numbers) { [1,2,3,11,11,5] }
    it { is_expected.not_to be_valid }
  end

  context 'without repeating numbers' do
    let(:numbers) { [14,1234,11] }
    it { is_expected.to be_valid }
  end
end

describe Region, '#complete?' do
  subject { Region.new(numbers) }

  context 'with skipped numbers' do
    let(:numbers) { [1,2,3,11,12] }
    it { is_expected.not_to be_complete }
  end

  context 'without skipped numbers not including 1' do
    let(:numbers) { [5,4,3] }
    it { is_expected.not_to be_complete }
  end

  context 'without skipped numbers including 1' do
    let(:numbers) { [5,2,3,4,1].to_a }
    it { is_expected.to be_complete }
  end
end
