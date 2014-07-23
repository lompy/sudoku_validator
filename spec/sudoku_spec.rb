require 'rspec'
require_relative '../lib/combiner.rb'

describe Combiner, '.new' do
  it 'takes collection and query method names' do
    expect{ Combiner.new(collection: [], queries: []) }.not_to raise_error
  end

  it 'does not take anythins else' do
    expect{ Combiner.new('something') }.to raise_error
  end

  it 'defines query method names on instance' do
    expect(Combiner.new(collection: [], queries: ['foo', 'bar'])).to respond_to(:foo, :bar)
  end
end

describe Combiner, '#query' do
  context 'with example query "foo"' do
    subject { Combiner.new(collection: collection, queries: ['foo']).foo }

    context 'with empty collection' do
      let(:collection) { [] }
      it { is_expected.to be false }
    end

    context 'with non empty collection' do
      context 'when every item.foo is true' do
        let(:collection) do 
          [ double('item', foo: true), 
            double('item', foo: true), 
            double('item', foo: true)] 
        end
        it { is_expected.to be true }
      end

      context 'when some item.foo is false' do
        let(:collection) do 
          [ double('item', foo: true), 
            double('item', foo: false), 
            double('item', foo: true)] 
        end
        it { is_expected.to be false }
      end
    end
  end
end
