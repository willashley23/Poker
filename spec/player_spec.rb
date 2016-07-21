require 'player'
require 'card'

describe Player do
  subject(:player) {Player.new}

  describe "#discard" do
    it "Removes cards from hand" do
      player.hand.hand_array = [
          Card.new("Heart",5),
          Card.new("Spades",8),
          Card.new("Heart",5),
          Card.new("Diamond",8),
          Card.new("Heart",8)
      ]
      player.discard(0,1)
      expect(player.hand.hand_array.length).to eq(3)
    end

    it "Discards the correct cards" do
      player.hand.hand_array = [
          Card.new("Heart",5),
          Card.new("Spades",8),
          Card.new("Heart",1),
          Card.new("Diamond",8),
          Card.new("Heart",8)
      ]
      player.discard(0,1)
      temp = []
      player.hand.hand_array.each do |card|
        temp << card.suit << card.suit
      end
      temp = temp.each_slice(2).to_a
      temp.each do |pair|
        expect(pair).not_to eq(["Heart",5])
      end
      temp.each do |pair|
        expect(pair).not_to eq(["Spades",8])
      end
    end

    it "Checks for out of bounds" do
      player.hand.hand_array = [
          Card.new("Heart",5),
          Card.new("Spades",8),
          Card.new("Heart",5),
          Card.new("Diamond",8),
          Card.new("Heart",8)
      ]
      expect{player.discard(0,8)}.to raise_error(ArgumentError)
    end
  end

  describe "#draw" do
    it "

  end

end
