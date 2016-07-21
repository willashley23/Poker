require_relative 'deck'
require_relative 'player'

class Game
  attr_accessor :deck, :human_player1, :human_player2, :pot
def initialize
  @deck = Deck.new
  @human_player1 = Player.new
  @human_player2 = Player.new
  @pot = 0
end

def play_game
  @deck.deal_hand(@human_player1.hand)
  @deck.deal_hand(@human_player2.hand)
  #until....
  render_hand(@human_player1)
  puts "Player 1, what would you like to do:"
  puts "1: discard & draw"
  puts "2: bet"
  puts "3: see"
  puts "4: raise"
  puts "5: fold"
  puts "6: reveal hand"
  puts "You have #{@human_player1.chips} chips."
  choice = gets.to_i
  case choice
    when 1
      puts "Choose cards to discard (type -1 to quit)"
      indeces = []
      index = gets.to_i
        until index == -1
          indeces << index
          puts "Choose cards to discard (type -1 to quit)"
          index = gets.to_i
        end
      draw(@human_player1,indeces)
      render_hand(@human_player1)
    when 2
      puts "Enter bet amount"
      begin
        amount = gets.to_i
        @human_player1.bet(amount)
      rescue ArgumentError
        puts "You dont have enough chips, enter another amount."
        retry
      end
    when 3
      begin
        @human_player1.see
      rescue ArgumentError
        puts "Cannot see when nothing has been raised."
      end
    when 4
      puts "Raise to what amount?"
      amnt = gets.to_i
      @human_player1.raise_bet(amnt)
      #Make raised an instance variable of game
    when 5
      puts "Player folds"
      # break
    when 6
      #render
      @human_player1.hand.score_hand
      @human_player2.hand.score_hand
      puts "Final score: #{@human_player1.hand.points}, #{@human_player2.hand.points}"
      # break
    end


end

def render_hand(current_player)
  current_player.hand.hand_array.each do |card|
    print card.value
    case card.suit
      when "Spades"
        print " ♠ "
      when "Heart"
        print " ♥ "
      when "Diamond"
        print " ♦ "
      when "Clubs"
        print " ♣ "
      end
    print " "
  end
  puts " "
end


def draw(player, *discard_cards)
  player.discard(discard_cards)
    return false if player.hand.hand_array.count == 5
    discard_cards.length.times do |n|
      player.hand.hand_array << deck.card_array[n]
    end
    discard_cards.length.times do
      @deck.card_array.shift
    end
  true
end

def collect_winnings(winning_player)
  winning_player.chips += @pot
end




end

g = Game.new
g.play_game
