require 'deck'
require 'hand'
describe Deck do
  subject(:d) {Deck.new}
  let (:h) {Hand.new}

    describe "#initialize" do
      it "Contains an array of size 52" do
        expect(d.card_array.count).to eq(52)
      end
    end

    describe "#populate_deck" do
      it "Correctly adds 4 pairs of 13 cards" do
        aces = d.card_array.sort_by{|x| x.value}[0..3]
        aces.each do |c|
          expect(c.value).to eq(1)
        end
      end
    end

    describe "#deal_hand" do
      it "Gives the hand 5 cards" do
        d.deal_hand(h)
        expect(h.hand_array.count).to eq(5)
      end

      it "Keeps track of the size of the deck after dealing" do
        d.deal_hand(h)
        expect(d.card_array.count).to eq(47)
      end
    end

    describe "#replenish_hand" do
      it "Forbids drawing if the hand is size 5" do
        d.deal_hand(h)
        expect(d.replenish_hand(h)).to eq(false)
      end

      it "Gives three cards to the hand" do
        d.deal_hand(h)
        h.hand_array.pop(3)
        d.replenish_hand(h)
        expect(h.hand_array.count).to eq(5)
      end

      it "Keeps track of the deck size after drawing" do
        d.deal_hand(h)
        h.hand_array.pop(3)
        d.replenish_hand(h)
        expect(d.card_array.count).to eq(44)
      end
    end
end
