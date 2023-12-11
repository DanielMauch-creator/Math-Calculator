# frozen_string_literal: true

require "test_helper"
# require_relative "./app/models/calculation"

class CalculationTest < ActiveSupport::TestCase

  fixtures :calculation
  # test "the truth" do
  #   assert true
  # end
  def test_addition
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'addition', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.save
    p calculation.valid?
    p calculation.errors
    assert_equal(4, calculation.result)
  end
  
  def test_subtraction
    calculation = Calculation.new(number_one: 3, number_two: 2, arithmetic: 'subtraction', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.save
    p calculation.valid?
    p calculation.errors
    assert_equal(1, calculation.result)
  end
  
  def test_multiplication
    calculation = Calculation.new(number_one: 4, number_two: 3, arithmetic: 'multiplication', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.save
    p calculation.valid?
    p calculation.errors
    assert_equal(12, calculation.result)
  end
  
  def test_division
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.save
    p calculation.valid?
    p calculation.errors
    assert_equal(1, calculation.result)
  end
  
  test 'Calculation should be valid with number_one' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.valid?
    assert calculation.save
    p calculation.errors.details[:number_one]
    assert_equal( [], calculation.errors.details[:number_one])
  end
  
  test 'Calculation should not be valid with number_one (no Characters)' do
    calculation = Calculation.new(number_one: 'division', number_two: 2, arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    #assert calculation.save
    p calculation.errors.details[:number_one]
    assert_equal( [{:error=>:not_a_number, :value=>"division"}], calculation.errors.details[:number_one])
  end
  
  test 'Calculation should not be valid with number_one (blank)' do
    calculation = Calculation.new(number_one: '', number_two: 2, arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    #assert calculation.save
    p calculation.errors.details[:number_one]
    assert_equal( [{:error=>:too_short, :count=>1}, {:error=>:blank}, {:error=>:not_a_number, :value=>""}], calculation.errors.details[:number_one])
  end
  
  test 'Calculation should be valid with number_two' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.valid?
    p calculation.errors.details[:number_two]
    assert_equal( [], calculation.errors.details[:number_two])
  end
  
  test 'Calculation should not be valid without number_two (no Characters)' do
    calculation = Calculation.new(number_one: 2, number_two: 'test', arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    p calculation.errors.details[:number_two]
    assert_equal( [{:error=>:not_a_number, :value=>"test"}], calculation.errors.details[:number_two])
  end
  
  test 'Calculation should not be valid without number_two (blank)' do
    calculation = Calculation.new(number_one: 2, number_two: '', arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    p calculation.errors.details[:number_two]
    assert_equal( [{:error=>:too_short, :count=>1}, {:error=>:blank}, {:error=>:not_a_number, :value=>""}], calculation.errors.details[:number_two])
  end
  
  test 'Calculation should be valid with arithmetic' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.valid?
    p calculation.errors.details[:arithmetic]
    assert_equal( [], calculation.errors.details[:arithmetic])
  end
  
  test 'Calculation should not be valid without arithmetic (too short)' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'test', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    p calculation.errors.details[:arithmetic]
    assert_equal( [{:error=>:inclusion, :value=>calculation.arithmetic}, {:error=>:too_short, :count=>8}], calculation.errors.details[:arithmetic])
  end
  
  test 'Calculation should not be valid without arithmetic (blank)' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: '', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    p calculation.errors.details[:arithmetic]
    assert_equal( [{:error=>:inclusion, :value=>calculation.arithmetic}, {:error=>:too_short, :count=>8}, {:error=>:blank}], calculation.errors.details[:arithmetic])
  end
  
  test 'Calculation should be valid with status' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'division', status: 'public', calculator_id: calculator(:one).id)
    assert calculation.valid?
    p calculation.errors.details[:status]
    assert_equal( [], calculation.errors.details[:status])
  end
  
    test 'Calculation should not be valid without status (too short)' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'division', status: 'test', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    p calculation.errors.details[:status]
    assert_equal( [{:error=>:inclusion, :value=>"test"}, {:error=>:too_short, :count=>6}], calculation.errors.details[:status])
  end
  
    test 'Calculation should not be valid without status (blank)' do
    calculation = Calculation.new(number_one: 2, number_two: 2, arithmetic: 'division', status: '', calculator_id: calculator(:one).id)
    assert calculation.invalid?
    p calculation.errors.details[:status]
    assert_equal( [{:error=>:inclusion, :value=>""}, {:error=>:blank}, {:error=>:too_short, :count=>6}], calculation.errors.details[:status])
  end
end
