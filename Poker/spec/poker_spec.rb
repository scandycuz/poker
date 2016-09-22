require 'poker'
require 'rspec'

describe Poker do

  describe "#initialize" do
    it "creates a shuffled deck"

    it "sets the game's players"

    it "sets the current player to first player in rotation"
  end

  describe "#initialize_turn" do
    context "each player dealt 5 cards"
  end

  describe "#bet" do

    it "keeps track of the current bet value"
  end

  describe "#current_turn" do
    it "returns the player who's turn it is"
  end

  describe "get_pot_amount" do
    it "returns the total value of the pot"
  end

  describe "#next_player" do
    it "switches to next player in rotation"
  end

end
