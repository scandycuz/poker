require 'card'
require 'rspec'

describe Card do

  let(:card) { Card.new(:club, 8)}

  describe "#initialize" do
    it "assigns a suit value to the card" do
      expect(card.suit).to eq(:club)
    end

    it "assigns a number value to the card" do
      expect(card.value).to eq(8)
    end
  end

end
