require 'pry'

class CreditCheck
  attr_reader :card_number

  def initialize(card_number = nil)
    @card_number = card_number
    @valid = false
  end

  # Your Luhn Algorithm Here
  def array
    card_array = @card_number.split("")
    card_array.map! { |number| number.to_i}
  end

  def doubles
    doubled_array = array()
    every_other_number = doubled_array.length % 2
    doubled_array.map.with_index do |number, index|
      if index % 2 == every_other_number
        number
      else
        number * 2
      end
    end
  end
  # Output
  ## If it is valid, print "The number is valid!"
  ## If it is invalid, print "The number is invalid!"
end

test = CreditCheck.new("12345678")
test.doubles

  # card_number = "4929735477250543"
