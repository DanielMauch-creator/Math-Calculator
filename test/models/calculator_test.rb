# frozen_string_literal: true

require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase

  def test_the_truth
    assert true
  end

  test 'should report error' do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

  test 'should save Calculator with title' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: 'public')
    assert calculator.valid?
    p calculator.errors.details[:title]
    assert_equal( [], calculator.errors.details[:title])
    assert_equal( [], calculator.errors.full_messages)
  end

  test 'should not save Calculator without title' do
    calculator = Calculator.new(title: '', body: 'My first Test Calculator!', status: 'public')
    assert calculator.invalid?
    p calculator.errors.details[:title]
    assert_equal( [{:error=>:blank}, {:error=>:too_short, :count=>10}], calculator.errors.details[:title])
    assert_equal( ["Title can't be blank", "Title is too short (minimum is 10 characters)"], calculator.errors.full_messages)
    
  end

  test 'should save with body' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator', status: 'public')
    assert calculator.valid?
    p calculator.errors.details[:body]
    assert_equal( [], calculator.errors.details[:body])
    assert_equal( [], calculator.errors.full_messages)
    
  end

  test 'should not save Calculator without body' do
    calculator = Calculator.new(title: 'Test Calculator!', body: '', status: 'public')
    assert calculator.invalid?
    p calculator.errors.details[:body]
    assert_equal( [{:error=>:blank}, {:error=>:too_short, :count=>10}], calculator.errors.details[:body])
    assert_equal( ["Body can't be blank", "Body is too short (minimum is 10 characters)"], calculator.errors.full_messages)
  end

  test 'should save Calculator with Status' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: 'public')
    assert calculator.valid?
    p calculator.errors.details[:status]
    assert_equal( [], calculator.errors.details[:status])
    assert_equal( [], calculator.errors.full_messages)
  end

  test 'should not save Calculator without Status' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: '')
    assert calculator.invalid?
    p calculator.errors.details[:status]
    p calculator.errors.full_messages
    assert_equal( [{:error=>:inclusion, :value=>""}, {:error=>:blank}, {:error=>:too_short, :count=>6}], calculator.errors.details[:status])
    assert_equal( ["Status is not included in the list", "Status can't be blank", "Status is too short (minimum is 6 characters)"], calculator.errors.full_messages)
  end
  
  test'Calculator title should be valid' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: 'public')
    assert calculator.valid?
    #p calculator.errors.details[:title]
    p calculator.errors.full_messages
    assert_equal( [], calculator.errors.details[:title])
    assert_equal( [], calculator.errors.full_messages)

  end
  
  test'Calculator title should not be valid(blank)' do
    calculator = Calculator.new(title: '', body: 'My first Test Calculator!', status: 'public')
    assert calculator.invalid?
    #p calculator.errors.details[:title]
    p calculator.errors.full_messages
    assert_equal( [{:error=>:blank}, {:error=>:too_short, :count=>10}], calculator.errors.details[:title])
    assert_equal( ["Title can't be blank", "Title is too short (minimum is 10 characters)"], calculator.errors.full_messages)

  end
  
  test'Calculator title should not be valid(too short)' do
    calculator = Calculator.new(title: 'test', body: 'My first Test Calculator!', status: 'public')
    assert calculator.invalid?
    #p calculator.errors.details[:title]
    p calculator.errors.full_messages
    assert_equal( [{:error=>:too_short, :count=>10}], calculator.errors.details[:title])
    assert_equal( ["Title can't be blank", "Title is too short (minimum is 10 characters)"], calculator.errors.full_messages)
  end
  
  test'Calculator body should be valid' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: 'public')
    assert calculator.valid?
    p calculator.errors.details[:body]
    assert_equal( [], calculator.errors.details[:body])
  end
  
  test'Calculator body should not be valid(blank)' do
    calculator = Calculator.new(title: 'Test Calculator!', body: '', status: 'public')
    assert calculator.invalid?
    p calculator.errors.details[:body]
    assert_equal( [{:error=>:blank}, {:error=>:too_short, :count=>10}], calculator.errors.details[:body])
  end
  
    test'Calculator body should not be valid(too short)' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'body', status: 'public')
    assert calculator.invalid?
    p calculator.errors.details[:body]
    assert_equal( [{:error=>:too_short, :count=>10}], calculator.errors.details[:body])
  end
  
  test'Calculator status should be valid' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: 'public')
    assert calculator.valid?
    p calculator.errors.details[:status]
    assert_equal( [], calculator.errors.details[:status])
  end
  
  test'Calculator status should not be valid(blank)' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: '')
    assert calculator.invalid?
    p calculator.errors.details[:status]
    assert_equal( [{:error=>:inclusion, :value=>""}, {:error=>:blank}, {:error=>:too_short, :count=>6}], calculator.errors.details[:status])
  end
  
  test'Calculator status should not be valid(too short)' do
    calculator = Calculator.new(title: 'Test Calculator!', body: 'My first Test Calculator!', status: 'test')
    assert calculator.invalid?
    p calculator.errors.details[:status]
    assert_equal( [{:error=>:inclusion, :value=>"test"}, {:error=>:too_short, :count=>6}], calculator.errors.details[:status])
  end
end
