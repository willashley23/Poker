require_relative 'hand'

class Player
  attr_accessor :hand, :pot, :chips, :raised

  def initialize
    @hand = Hand.new
    @chips = 20
    @raised = 0
  end

  def see
    raise ArugmentError if @chips < @raised
    raise ArugmentError if @raised == 0
    @chips -= @raised
  end

  def raise_bet(amount)
    raise ArugmentError if amount <  @raised
    raise ArugmentError if amount < @chips
    @raised += amount
    @chips -= amount
  end

  def bet(amount)
    raise ArgumentError if amount > @chips
    @chips -= amount
  end

  def discard(*card_indeces)
    card_indeces.each do |idx|
      tempidx = idx.flatten[0]
      raise ArgumentError if !tempidx.between?(0,@hand.hand_array.count-1)
      current_card = @hand.hand_array[tempidx]
      @hand.hand_array.delete(current_card)
    end
  end

end
