require 'hand'
require 'rspec'
require 'byebug'

HEIRARCHY_ALT = [
  :high_card,
  :one_pair,
  :two_pair,
  :three_of_a_kind,
  :straight,
  :flush,
  :full_house,
  :four_of_a_kind,
  :straight_flush,
  :royal_flush
]


describe Hand do
  let(:hand_empty) { Hand.new }
  let(:card1) {Card.new(:club, 8)}
  let(:card2) {Card.new(:heart, 8)}
  let(:card3) {Card.new(:diamond, 8)}
  let(:card4) {Card.new(:heart, 10)}
  let(:card5) {Card.new(:club, 10)}
  let(:card6) {Card.new(:club, 2)}
  let(:card7) {Card.new(:club, 4)}
  let(:card8) {Card.new(:club, 3)}
  let(:card9) {Card.new(:club, 5)}
  let(:card10) {Card.new(:club, 6)}
  let(:hand_full) { Hand.new([card1, card2, card3, card4, card5]) }
  let(:hand_two) { Hand.new([card6, card6, card4, card7, card1]) }
  let(:hand_straight) { Hand.new([card6, card7, card8, card9, card10]) }

  describe "#initialize" do
    it "stores a heirarchy of hands" do
      expect(hand_empty.heirarchy).to eq(HEIRARCHY_ALT)
    end

    it "creates an empty array to store cards in if nothing is passed" do
      expect(hand_empty.cards).to eq([])
    end
  end

  describe "#get_hand_pattern" do
    it "returns the heirarchy index of the highest value card pattern" do
      expect(hand_full.get_hand_pattern).to eq(:full_house)
    end
  end

  describe "#get_duplicate_values" do
    it "returns a hash of number counts that are higher than 1" do
      expect(hand_full.get_duplicate_values).to eq({8 => 3, 10 => 2})
    end
  end

  describe "#get_high_card_values" do
    it "returns an array of card values sorted" do
      expect(hand_full.get_high_card_values).to eq([10,10,8,8,8])
    end

  end

  describe "#stronger_hand?" do
    it "compares against another hand and returns true if self is stronger" do

      #debugger
      expect(hand_full.stronger_hand?(hand_two)).to be true
    end
  end

  describe "#get_card" do

    it "gets a card and adds it to the hand array" do
      hand_empty.get_card(card1)
      expect(hand_empty.cards).to eq([card1])
    end
  end

  describe "#discard_card" do

    it "removes a card from the hand" do
      hand_empty.get_card(card1)
      hand_empty.discard_card(1)
      expect(hand_empty.cards).to be_empty
    end
  end

  describe "#full?" do
    it "returns true if hand is full" do
      expect(hand_full.full?).to be true
    end
  end

  describe "#straight?" do
    it "returns true if card values are sequential" do
      expect(hand_straight.straight?).to be true
    end

    it "returns false if card values are not sequential" do
      expect(hand_full.straight?).to be false
    end
  end
end
