require '01_hanoi'
require 'rspec'

describe "Towers of Hanoi game" do
  subject(:game) {TowersOfHanoiGame.new()}

  describe "#move" do
    it "receives start pile and end pile positions" do
      expect(subject).to receive(:move).with(0, 1)
      subject.move(0,1)
    end

    it "moves piece to new position" do
      subject.move(0,1)
      expect(game.towers[1]).to eq([1])
    end

    it "moves piece from old position" do
      subject.move(0,1)
      expect(game.towers[0]).to eq([2,3])
    end

    it "doesn't move a bigger piece onto a smaller piece" do
      subject.towers = [[1],[2],[3]]

      expect{ game.move(1,0) }.to raise_error
    end
  end

  describe "#won" do
    it "returns true if game is over" do
      subject.towers = [[],[],[1,2,3]]

      expect(game.won?).to be true
    end

    it "returns false if game is not over" do
      subject.towers = [[],[2],[1,3]]

      expect(game.won?).to be false
    end

    it "returns false if starting position is full" do
      expect(game.won?).to be false
    end
  end

end
