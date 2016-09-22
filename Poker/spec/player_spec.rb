require 'player'
require 'rspec'

describe Player do
let(:player) {Player.new("Trevor")}

  describe "#initialize" do

    it "creates a hand variable" do
      expect(player.hand).to_not be nil
    end

    it "has a pot value" do
      expect(player.pot).to eq(0)
    end
  end

  describe "#discard" do
    it "asks the player which cards they would like discard"

    it "removes those cards from their hand"
  end

  describe "#fold" do

    it "makes them surrender the round" do
      player.fold
      expect(player.hand.empty?).to be true
    end
  end

  describe "#check" do

    it "it doesn't do anything" 
  end

  describe "#raise_pot" do

      it "increases the pot value" do
        player.raise_pot(50)
        expect(player.pot).to eq(50)
      end
  end
end
