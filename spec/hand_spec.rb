require 'card'
require 'hand'


describe Hand do

  subject(:h) {Hand.new}

  describe "#has_one_pair?" do

    it "Does not conflate three-of-a-kind with pairs" do
      h.hand_array = [
        Card.new("Heart",5),
        Card.new("Spades",8),
        Card.new("Heart",5),
        Card.new("Diamond",8),
        Card.new("Heart",8)
      ]
      expect(h.has_one_pair?).to eq(true)
    end
  end

  describe '#has_two_pair?' do
    it "returns true if there are two pairs" do
      h.hand_array = [
        Card.new("Heart",5),
        Card.new("Spades",7),
        Card.new("Heart",5),
        Card.new("Diamond",7),
        Card.new("Heart",8)
      ]
      expect(h.has_two_pair?).to eq(true)
    end
  end

  describe "#has_triplet?" do
    it "Correctly finds triples" do
      h.hand_array = [
        Card.new("Heart",5),
        Card.new("Spades",8),
        Card.new("Heart",5),
        Card.new("Diamond",8),
        Card.new("Heart",8)
      ]
      expect(h.has_triplet?).to eq(true)
    end
  end

  describe "#has_straight?" do
    it "Identifies a straight" do
      h.hand_array = [
        Card.new("Heart",1),
        Card.new("Spades",2),
        Card.new("Heart",3),
        Card.new("Diamond",4),
        Card.new("Heart",5)
      ]
      expect(h.has_straight?).to be(true)
    end
  end

  describe "#has_flush?" do
    it "Identifies a flush" do
      h.hand_array = [
        Card.new("Heart",1),
        Card.new("Heart",4),
        Card.new("Heart",7),
        Card.new("Heart",9),
        Card.new("Heart",5)
      ]
      expect(h.has_flush?).to be(true)
    end
  end


  describe "#score_hand" do
    it "Scores a straight flush correctly" do
      h.hand_array = [
        Card.new("Heart",1),
        Card.new("Heart",2),
        Card.new("Heart",3),
        Card.new("Heart",4),
        Card.new("Heart",5)
      ]
      h.score_hand
      expect(h.points).to eq(7)
    end

    it "Scores a full house correctly" do
      h.hand_array = [
        Card.new("Heart",4),
        Card.new("Diamond",4),
        Card.new("Clubs",4),
        Card.new("Heart",9),
        Card.new("Spades",9)
      ]
      h.score_hand
      expect(h.points).to eq(6)
    end

    it "Scores pairs correctly" do
      h.hand_array = [
        Card.new("Heart",4),
        Card.new("Clubs",4),
        Card.new("Heart",7),
        Card.new("Diamond",7),
        Card.new("Heart",5)
      ]
      h.score_hand
      expect(h.points).to eq(2)
    end

    it "Scores one pair correctly" do
      h.hand_array = [
        Card.new("Clubs",4),
        Card.new("Heart",4),
        Card.new("Heart",7),
        Card.new("Spades",9),
        Card.new("Heart",5)
      ]
      h.score_hand
      expect(h.points).to eq(1)
    end
  end
end
