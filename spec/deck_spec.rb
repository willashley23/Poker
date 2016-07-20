require 'deck'
require 'hand'
describe Deck do
  subject(:d) {Deck.new}
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
        h = Hand.new
        d.deal_hand(h)
        expect(h.hand_array.count).to eq(5)
      end

      it "Keeps track of the size of the deck after dealing" do
        h = Hand.new
        d.deal_hand(h)
        expect(d.card_array.count).to eq(47)
      end


    end


end
