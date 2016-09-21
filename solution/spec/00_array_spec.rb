require '00_array'
require 'rspec'

describe "#array" do
  subject { Array.new([1,2,3,2,4,1]) }

  describe "#my_uniq" do
    it "accepts an array" do
      expect(subject).to receive(:my_uniq).with([1,2,2,3,1,4])
      subject.my_uniq([1,2,2,3,1,4])
    end

    it "returns an array" do
      expect(subject.my_uniq).to be_a(Array)
    end

    it "removes not unique elements" do
      expect(subject.my_uniq).to eq([1,2,3,4])
    end
  end

  describe '#two sum' do
    let(:arr) {Array.new([-1,0,2,-2,1]) }

    it "returns indices that sum to 0" do
      expect(arr.two_sum).to eq([[0,4],[2,3]])
    end

    it "returns elements in order" do
      expect(arr.two_sum).to eq(arr.two_sum.sort)
    end
  end

  describe "#my_transpose" do
    let(:arr) {Array.new([
        [0,1,2],
        [3,4,5],
        [6,7,8]
      ])}

      it "returns a transposed array" do
        expect(arr.my_transpose(arr)).to eq(arr.transpose)
      end
  end

  describe "#stock_picker" do
    let(:arr1) { [6,4,8,12,14,6,8]}
    let(:arr2) { [6,16,2,12,14,8,5]}

    it "returns the indices of the greatest profit" do
      expect(arr1.stock_picker).to eq([1,4])
    end

    it "only allows selling the stock after the purchase" do
      expect(arr2.stock_picker).to eq([2,4])
    end
  end
end
