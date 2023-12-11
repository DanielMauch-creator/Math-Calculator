# frozen_string_literal: true

require 'test_helper'

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  fixtures :calculation
  # test "the truth" do
  #   assert true
  # end
  
  test "should create calculation" do
    assert_difference("Calculation.count") do
      post calculator_calculations_path(calculator_id: calculator(:one).id), params: { calculation: {status: 'public', number_one: 2, number_two: 3, arithmetic: 'addition'} }
      #p calculation.valid?
      #p calculation_controller.errors
    end

    assert_redirected_to calculator_path(calculator(:one))
    assert_equal "Calculation was successfully created.", flash[:notice]
  end
  
  test "should destroy calculator" do
    assert_difference("Calculation.count", -1) do
      delete calculator_calculation_path(calculator_id: calculator(:one).id)
    end

    assert_redirected_to calculator_path(calculator(:one))
  end
end
