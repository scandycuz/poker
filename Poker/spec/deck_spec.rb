require 'deck'
require 'rspec'

describe Deck do
  let (:d) {Deck.new}
  describe "#initialize" do

    it "calls #add_cards method" do
      expect(d).to receive(:add_cards)
      d.add_cards
    end

    it "shuffles the deck" do
      expect(d.cards).to_not eq(d.cards.sort_by { |card| card.value })
    end
  end

  describe "#add_cards" do
    it "it adds all neccesary cards to the deck" do
      expect(d.cards.length).to eq(52)
    end

  end

  describe "#shuffle_deck" do
    it "shuffles the deck" do
      expect(d.cards).to receive(:shuffle)
      d.shuffle_deck
    end
  end

  describe "#draw" do
    it "draws a card" do
      expect(d.draw).to be_a(Card)
    end
  end

end
