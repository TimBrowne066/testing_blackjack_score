require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new([Card.new("♦",10), Card.new("♥","6")]) }
  let(:hand2) { Hand.new([Card.new("♦",10), Card.new("♥","J")]) }
  let(:hand3) { Hand.new([Card.new("♦","A"), Card.new("♥",2)]) }
  let(:hand4) { Hand.new([Card.new("♦","A"), Card.new("♥","A")]) }
  let(:hand5) { Hand.new([Card.new("♦","A"), Card.new("♥","A"), Card.new("♠","A")]) }
  let(:hand6) { Hand.new([Card.new("♦","A"), Card.new("♥","J"), Card.new("♠","10")]) }


  # You can add more sample hands

  describe "#calculate_hand" do
    it 'adds calculates the score of your hand.' do
      expect(hand.calculate_hand).to eq 16
    end

    it 'adds 10 for a face card.' do
      expect(hand2.calculate_hand).to eq 20
    end

    it 'adds 11 for an ace if the total does not exceed 21' do
      expect(hand3.calculate_hand).to eq 13
    end

    it 'adds 1 for an ace if the total would otherwise exceed 21' do
      expect(hand4.calculate_hand).to eq 12
    end

    it 'Adds 1 for the second two of three aces.' do
      expect(hand5.calculate_hand).to eq 13
    end


    it 'Changes the first ace to 1 if the score goes over 21.' do
        expect(hand6.calculate_hand).to eq 21
    end

#
  # end
  end
end
