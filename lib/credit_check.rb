require 'pry'

class CreditCheck
  attr_reader :card_number

  def initialize(card_number = 0)
    @card_number = card_number
    @check_digit = card_number[-1].to_i
    @valid = false
  end

  # Your Luhn Algorithm Here
  def array_of_ints
    @card_number.split("").map(&:to_i)
  end

  def double_every_other
    doubled_array = array_of_ints()
    start_index = doubled_array.length % 2
    doubled_array.map.with_index do |number, index|
      if index % 2 == start_index
        number * 2
      else
        number
      end
    end
  end

  def sum_digits_over_ten
    array_for_validation = double_every_other()
    array_for_validation.map do |number|
      if number > 9
        number - 9
      else
        number
      end
    end
  end

  def validate_card
    card_test_array = sum_digits_over_ten()
    card_test_array[-1] = @check_digit
    if card_test_array.sum % 10 == 0
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
  # Output
  ## If it is valid, print "The number is valid!"
  ## If it is invalid, print "The number is invalid!"
  def runner
    #Commented out code in block adds user interface in terminal
    # puts "Enter a card number"
    # @card_number = gets.chomp
    if @card_number.length == 15 || @card_number.length == 16
      validate_card
    else
      puts "Not the correct length. Please try again."
      # runner
    end
  end
end

# test_card = CreditCheck.new("4929735477250543")
# test_card.runner

# card_number = "4929735477250543"
