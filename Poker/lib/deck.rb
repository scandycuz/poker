require_relative 'card'
class Deck

  SUITS = [:spades, :hearts, :clubs, :diamonds]
  attr_reader :cards
  def initialize()
    @cards = []
    add_cards
    shuffle_deck
  end

  def add_cards
    (1..13).each do |val|
      SUITS.each{|suit| @cards << Card.new(suit,val)}
    end
  end


  def shuffle_deck
    @cards.shuffle
  end

  def draw
    return @cards.pop
  end
end
