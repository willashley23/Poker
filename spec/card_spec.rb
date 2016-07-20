require 'card'

describe Card do
  subject(:card) {Card.new("Heart",4)}
  describe "#initialize" do
    it "adds a suit and value to the card" do
      expect(card.suit).to eq("Heart")
      expect(card.class).to eq(Card)
      expect(card.value).to eq(4)
    end
  end


end
