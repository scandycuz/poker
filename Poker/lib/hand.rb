require_relative 'card'

class Hand
  attr_accessor :cards
  attr_reader :heirarchy

  HEIRARCHY = [
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

  def initialize(cards = [])
    @cards = cards
    @heirarchy = HEIRARCHY
  end

  def get_hand_pattern
    if flush?
      if straight?
        if get_high_card_values.all? { |value| value > 9 }
          return :royal_flush
        else
          return :straight_flush
        end
      else
        return :flush
      end
    elsif straight?
      return :straight
    else
      duplicate_counts = get_duplicate_values
      case duplicate_counts.values.max
      when 4
        return :four_of_a_kind
      when 3
        if duplicate_counts.values.include?(2)
          return :full_house
        else
          return :three_of_a_kind
        end
      when 2
        if duplicate_counts.values.count(2) == 2
          return :two_pair
        else
          return :one_pair
        end
      else
        return :high_card
      end
    end
  end

  def flush?
    @cards.all? { |card| card.suit == @cards.first.suit }
  end

  def straight?
    sorted_values = get_high_card_values

    sorted_values.each_with_index do |value, idx|
      next if sorted_values[idx + 1].nil?
      return false if value - 1 != sorted_values[idx + 1]
    end

    true
  end

  def get_duplicate_values
    card_counts = Hash.new { |card, count| card[count] = 0 }

    @cards.each do |card|
      card_counts[card.value] += 1
    end

    card_counts.reject { |card_value, count| count <= 1 }
  end

  def get_high_card_values
    card_values = []
    @cards.each { |card| card_values << card.value }
    card_values.sort.reverse
  end

  def stronger_hand?(other_hand)
    hand_pattern = HEIRARCHY.index(get_hand_pattern)
    other_hand_pattern = HEIRARCHY.index(other_hand.get_hand_pattern)

    case hand_pattern <=> other_hand_pattern
    when -1
      return false
    when 0
      return stronger_hand_value(other_hand)
    when 1
      return true
    end
  end

  def stronger_hand_value(other_hand)
    card_values = get_high_card_values
    other_card_values = other_hand.get_high_card_values

    until card_values.empty?
      case card_values.shift <=> other_card_values.shift
      when -1
        return false
      when 1
        return true
      else
        next
      end
    end

    :draw
  end

  def get_card(card)
    @cards << card
  end

  def discard_card(index)
    index -= 1
    @cards.delete_at(index)
  end

  def full?
    @cards.count >= 5
  end
end
