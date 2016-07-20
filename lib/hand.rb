class Hand

  attr_accessor :hand_array, :points

  def initialize
    @hand_array = Array.new(5)
    @suits = %w{Diamonds Clubs Hearts Spades}
    @points = 0
  end


  def score_hand
    if has_flush? && has_straight?
      @points += 7
    end
    @points += 5 if has_flush? && !has_straight?
    @points += 4 if has_straight? && !has_flush?
    @points += 3 if has_triplet?
    @points += 1 if has_one_pair? && !has_two_pair?
    @points += 2 if has_two_pair?
    @points += 1 if has_triplet? && has_one_pair?
  end


  def has_flush?
    temp_suit = @hand_array[0].suit
    @hand_array.all?{|x| x.suit == temp_suit}
  end

  def has_straight?
    all_values = []
    @hand_array.each do |card|
      all_values << card.value
    end
    all_values.sort.each_with_index do |card, index|
      if (index-1).between?(0,all_values.length-1)
        diff = card - all_values[index-1]
        return false unless diff == 1
      end
    end
    true
  end

  def has_one_pair?
    all_values = []
    @hand_array.each do |card|
      all_values << card.value
    end
    all_values.each do |val|
      return true if all_values.count(val) > 1
    end
    false
  end


  def has_two_pair?
    all_values = []
    @hand_array.each do |card|
      all_values << card.value
    end
    pairs = []
    all_values.each do |val|
      pairs << val if all_values.count(val) > 1
    end
    return true if pairs.uniq.length == 2
    false
  end

  def has_triplet?
    all_values = []
    @hand_array.each do |card|
      all_values << card.value
    end
    all_values.each do |val|
      return true if all_values.count(val) == 3
    end
    false
  end

end
