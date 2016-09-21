require 'hand'
require 'rspec'

describe Hand do
  let(:hand) { Hand.new }
  let(:card1) {Card.new(:club, 8)}

  describe "#initialize" do
    it "stores a heirarchy of hands" do
      expect(hand.HEIRARCHY).to eq(HEIRARCHY_ALT)
    end

    it "creates an empty array to store cards in" do
      expect(hand.cards).to eq([])
    end
  end

  describe "#royal_flush?" do
    it "returns true if #flush? is true, #straight? is true, and card values are all above 9"
  end

  describe "#straight_flush?" do
    it "returns true if straight? is true and #flush? is true"
  end

  describe "#full_house?" do
    it "returns true if #get_duplicate_values has one card with a count of two and one with three"
  end

  describe "flush?" do
    it "returns true if #flush is true"
  end

  describe "#straight?" do
    it "returns true #straight? is true"
  end

  describe "#three_of_a_kind" do
    it "returns true if #get_duplicate_values has one card with a count of 3"
  end

  describe "#two_pair?" do
    it "returns true if #get_duplicate_values has two pairs"
  end

  describe "#one_pair" do
    it "returns true if #get_duplicate_values only has one pair"
  end

  desribe "#get_duplicate_values" do
    it "returns a hash of number counts that are higher than 1"
  end

  describe "#get_high_card_values" do
    it "returns an array of card values sorted"
  end

  describe "#stronger_hand?" do
    it "compares against another hand and returns true if self is stronger"
  end

  describe "#get_card" do

    it "gets a card and adds it to the hand array" do
      hand.get_card(card1)
      expect(hand.cards).to eq([card1])
    end
  end

  describe "#discard_card" do

    it "removes a card from the hand" do
      hand.get_card(card1)
      hand.discard(card1)
      expect(hand.cards).to be_empty
    end
  end

end
