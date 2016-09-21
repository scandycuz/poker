class TowersOfHanoiGame
  attr_accessor :towers
  def initialize()
    @towers = Array.new(3) {[]}
    @towers[0] += [1,2,3]
  end

  def move(start_pile, end_pile)
    if valid_move?(start_pile,end_pile)
      @towers[end_pile].unshift(@towers[start_pile].shift)
    end
  end

  def valid_move?(start_pile,end_pile)
    raise "error" if @towers[start_pile].empty?
    return true if @towers[end_pile].empty?
    raise "error" unless @towers[start_pile].first < @towers[end_pile].first
    true
  end

  def get_input
    input = gets.chomp.split(",").map(&:to_i)
  end

  def play
    while !won?
      system("clear")
      render
      play_turn
    end
    puts("You win!")
  end

  def play_turn
    puts("Provide the start pile index and the end pile index: x,y")
    begin
      input = get_input
      start_pile,end_pile = input
      move(start_pile,end_pile)
    rescue
      puts ("Invalid move, try again")
      retry
    end
  end

  def won?
    @towers[1..2].any? { |tower| tower == [1,2,3] }
  end

  def render
    p @towers
  end
end

if $PROGRAM_NAME == __FILE__
  game = TowersOfHanoiGame.new
  game.play
end
