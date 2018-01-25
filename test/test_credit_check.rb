require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check.rb'

class TestCreditCheck < Minitest::Test
  def test_credit_check_instance
    credit_check = CreditCheck.new
    assert_instance_of CreditCheck, credit_check
  end

  def test_can_take_card_numbers
    numbers = ["5541808923795240", "4024007136512380", "6011797668867828"]
    numbers.each do |test_number|
      credit_check = CreditCheck.new(test_number)
      assert credit_check.card_number
    end
  end

  def test_create_number_array
    credit_check = CreditCheck.new("12345678")
    assert_equal [1,2,3,4,5,6,7,8], credit_check.array
  end

  def test_double_numbers_right_to_left
    credit_check = CreditCheck.new("12345678")
    assert_equal [1,4,3,8,5,12,7,16], credit_check.doubles
  end
end
