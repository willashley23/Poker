require_relative 'card'
require_relative 'hand'

class Deck

  attr_accessor :card_array

  def initialize
    @card_array = Array.new(52)
    @suits = %w{Heart Diamond Clubs Spades}
    populate_deck
    @card_array.shuffle!
  end

  def populate_deck
    @suits.each do |suit|
      i = 1
      while i < 14
        @card_array << Card.new(suit,i)
        i+=1
      end
      @card_array.rotate!(13)
    end
    @card_array.compact!
  end


  def deal_hand(hand)
    hand.hand_array = @card_array[0..4]
    5.times do
      @card_array.shift
    end
  end
end
d = Deck.new
# d.card_array.each do |v|
#   print v.value
#   print v.suit
#   puts ""
# end
