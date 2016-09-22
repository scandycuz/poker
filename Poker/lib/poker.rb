require_relative 'player'
require_relative 'deck'
class Poker
  attr_reader :players,:deck, :current_pot

  def initialize(players = [])
    @players = players
    @players_dup = []
    @deck = Deck.new
    @current_player = @players.first
    @current_pot = 0
  end

  def play

  end

  def play_turn
    @players_dup = @players
    initialize_turn
    get_player_actions
    get_discards
    get_player_actions
    winner = resolve_hands
    puts "Congratulations #{winner}"
  end

  def get_player_actions
    until all_pots_equal? || @players_dup.length == 1
      puts("Enter check, best, raise, or fold")
      player = @players_dup.first
      player_action = player.get_action
      case player_action
      when "check"

      when "bet"

      when "raise"

      else
        player.fold
        @players_dup.delete_at(0)
        next
      end
      switch_player(@players_dup)
    end
  end

  def switch_player
    @players_dup.push(@players_dup.shift)
  end

  def all_pots_equal?
    @current_pot != 0 && @players_dup.all? { |player| player.pot == @players_dup.first.pot }
  end

  def initialize_turn
    @players_dup.each{|player| 5.times{player.get_card(@deck.draw)}}
  end

  def get_discards
    @players_dup.each do |player|
      3.times do
        puts("Choose a card to discard or a letter to cancel")
        action = player.get_action
        case action.is_a?(Integer)
        when true
          player.discard(action)
        else
          break
        end
      end
    end
  end

  def resolve_hands
    until @players_dup.length == 1
      first_player = @players_dup[0]
      second_player = @players_dup[1]

      first_player.hand.stronger_hand?(second_player.hand) ? @players_dup.delete_at(1) : @players_dup.delete_at(0)
    end

    @players_dup.first
  end

end

if __FILE__ == $PROGRAM_NAME
  poker = Poker.new([Player.new,Player.new])
  poker.play_turn
end
