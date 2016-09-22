require_relative 'hand'

class Player
  attr_reader :name, :pot, :hand
  def initialize(name = "Trevor")
    @name = name
    @pot = 0
    @hand = Hand.new()
  end

  def raise_pot(val)
    @pot += val
  end

  def fold
    @hand = Hand.new()
  end

  def check

  end

  def reset_pot
    @pot = 0
  end

  def get_action
    gets.chomp
  end

  def get_card(card)
    @hand.get_card(card)
  end

  def discard(idx)
    @hand.discard(idx)
  end
end
