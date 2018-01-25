require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check.rb'

class TestCreditCheck < Minitest::Test
  def setup
    @credit_check = CreditCheck.new("12345678")
    @numbers = {
      "12345678" => [2,2,6,4,10,6,14,8],
      "342804633855673" => [3,8,2,16,0,8,6,6,3,16,5,10,6,14,3],
      "1234567890123456" => [2,2,6,4,10,6,14,8,18,0,2,2,6,4,10,6]
    }
  end

  def test_instances_can_take_card_numbers
    @numbers.keys.each do |number|
      credit_check = CreditCheck.new(number)
      assert_instance_of CreditCheck, credit_check
      assert_equal number, credit_check.card_number
    end
  end

  def test_array_of_ints
    assert_equal [1,2,3,4,5,6,7,8], @credit_check.array_of_ints
  end

  def test_double_every_other #tests strings of different lengths
    @numbers.each do |card_number, doubled_array|
      credit_check = CreditCheck.new(card_number)
      assert_equal doubled_array, credit_check.double_every_other
    end
  end

  def test_sum_digits_over_ten
    assert_equal [2,2,6,4,1,6,5,8], @credit_check.sum_digits_over_ten
  end

  def test_validate_card
    valid = ["5541808923795240", "4024007136512380", "6011797668867828", "342804633855673"]
    invalid = ["5541801923795240", "4024007106512380", "6011797668868728", "342801633855673"]
    valid.each do |card_number|
      credit_check = CreditCheck.new(card_number)
      assert_output("The number is valid!\n") { credit_check.validate_card }
    end
    invalid.each do |card_number|
      credit_check = CreditCheck.new(card_number)
      assert_output("The number is invalid!\n") { credit_check.validate_card }
    end
  end

  def test_runner
    to_short = CreditCheck.new("12345678")
    assert_output("Not the correct length. Please try again.\n") { to_short.runner }
    right_length = CreditCheck.new("5541808923795240")
    assert_output("The number is valid!\n") { right_length.runner }
  end
end
