# frozen_string_literal: true

require 'test_helper'

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  fixtures :calculator
  # test "the truth" do
  #   assert true
  # end
  setup do
    @calculator = calculator(:one)
  end

  teardown do
      Rails.cache.clear
  end
  
  test "should get index" do
    get calculators_url
    assert_response :success
    
    assert_equal "index", @controller.action_name
    #assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "Calculators", @response.body
  end
  
  test "should show calculator" do
    get calculator_url(@calculator)
    assert_response :success
  end
  
  test "should not show calculator" do
    get calculator_url(id: 7)
    #assert_equal "Calculator was not successfully shown.", flash[:notice]
    assert_response :redirect
  end
  
  test "should create calculator" do
    assert_difference("Calculator.count") do
      post calculators_url, params: { calculator: { status: 'public', body: "Rails is awesome!", title: "Calculatore" } }
    end

    assert_redirected_to calculator_path(Calculator.last)
    assert_equal "Calculator was successfully created.", flash[:notice]
  end
  
  test 'should not create calculator' do
    assert_no_difference('Calculator.count') do
      post calculators_url, params: { calculator: {  status: 'public', body: "", title: "Calculatore" } }
    end

    #assert_redirected_to calculator_path(Calculator.last)
    assert_equal "Calculator was not successfully created.", flash[:notice]
  end
  
    
  test "should destroy calculator" do
    assert_difference("Calculator.count", -1) do
      delete calculator_url(@calculator)
    end

    assert_redirected_to root_path
  end
  
  test "should update calculator" do
    patch calculator_url(@calculator), params: { calculator: { title: "Calculator updated" } }
    assert @calculator.valid?
    assert_redirected_to calculator_url(@calculator)
    # Reload association to fetch updated data and assert that title is updated.
    @calculator.reload
    assert_equal "Calculator updated", @calculator.title
  end
  
  test "should not update calculator" do
    cal = calculator(:one)
    patch calculator_url(cal), params: { calculator: { title: "" } }
    cal.reload
    p cal.title
    assert "updated", cal.title
    p cal.title
    response.status == 422
    cal.reload
    p cal.title
    assert_not_equal "", cal.title
    flash[:error] = "Your Test is working properly"
    #if (response.status == 422)
      #cal.reload
      #assert_not_equal "updated", cal.title                  
      #flash[:error] = "Your Test is not working properly"
    #end
    #@calculator.reload
    #assert_not_equal "updated", calculator(:one).title  
  end
end
    #p @calculator.errors.details[:title]
    #assert_redirected_to calculator_url(@calculator)
    # Reload association to fetch updated data and assert that title is updated.
    #p calculators_controller.errors
    #assert_not( @calculator.valid?)
    #@calculator.reload
    #@calculator.invalid?
    #p @calculator.errors.details
    #p @calculator.title
    #assert_not @calculator.valid?
