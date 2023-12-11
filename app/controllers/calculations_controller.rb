# frozen_string_literal: true

# a class for creating and destroying Calculations
class CalculationsController < ApplicationController
  
  def index
      @calculations = Calculation.all
  end
  
    def show
    @calculation = Calculation.find_by(id: params[:calculation_id])
    
    if @calculation.nil?
      redirect_to calculations_url
      flash[:alert] =  "Your Calculation was not successfully found."
    end
  end
  def create
    @calculator = Calculator.find(params[:calculator_id])
    @calculation = @calculator.calculations.create(calculation_params)
    #puts @calculator
    if @calculation.save
      redirect_to calculator_path(@calculator)
      flash[:notice] =  "Calculation was successfully created."
    else
    render :new, status: :unprocessable_entity
    flash[:notice] = "Calculator was not successfully created."
    end
  end

  def destroy
    @calculator = Calculator.find(params[:calculator_id])
    @calculation = @calculator.calculations.find(params[:id])
    @calculation.destroy
    redirect_to calculator_path(@calculator), status: :see_other
  end

  private

  def calculation_params
    params.require(:calculation).permit(:number_one, :number_two, :arithmetic, :status)
  end
end















  #def show
    #@calculator = Calculator.find(params[:calculator_id])
    #@calculation = @calculator.calculations.create(calculation_params)
    #if @calculation.nil?
      #redirect_to calculator_path(@calculator)
      #flash[:alert] =  "Your Calculation was not successfully found."
    #end
  #end
