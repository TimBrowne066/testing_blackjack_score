require_relative 'deck'

class Hand
  attr_accessor :cards, :score

  def initialize(cards)
    @cards = cards
    @score = 0
  end

  def calculate_hand
    aces = 0
    @cards.each do |card|
      if card.value == 'J' || card.value == "Q" || card.value == "K"
        @score += 10
      elsif card.value == 'A'
        @score += 11
        aces += 1
      # elsif card.value == 'A' && score >= 11
      #   @score += 1
      else
        @score += card.value.to_i
      end
    end
    while aces > 0 && score > 21 do
      @score -= 10
      aces -= 1
    end
    return @score
  end
end
deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
hand.calculate_hand
