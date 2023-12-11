# frozen_string_literal: true

# a class for funktions like create Calculator or edit Calculator
class CalculatorsController < ApplicationController
  
  def index
      @calculators = Calculator.all

  end

  def show
    @calculator = Calculator.find_by(id: params[:id])

    if @calculator.nil?
      #redirect_back(fallback_location: root_path)
      #render plain: "404 Not Found", status: 404
      redirect_to calculators_url
      #render :nothing => true, :status => :unprocessable_entity
      #@calculator = Calculator.all
      #render action: "index"
      #render status: :forbidden
      flash[:alert] =  "Your Calculator was not successfully found."

      
      #flash[:notice] =  "Calculator was successfully shown."
      #redirect_to @calculator
    #else
      #render status: :forbidden
      #render :show, status: :unprocessable_entity
      #flash[:notice] = "Calculator was not successfully shown."
    end
  end

  def new
    @calculator = Calculator.new
  end

  def edit
    @calculator = Calculator.find(params[:id])
  end

  def create
    @calculator = Calculator.new(calculator_params)
    if @calculator.save
      flash[:notice] =  "Calculator was successfully created."
      redirect_to @calculator
    else
      render :new, status: :unprocessable_entity
      flash[:notice] = "Calculator was not successfully created."
    end
  end

  def update
    @calculator = Calculator.find(params[:id])
    #@calculator.update(response: params.require(:calculator)[:response])
    if @calculator.update(calculator_params)
      flash[:notice] = 'Calculator has updated successfully'
      redirect_to @calculator
    else
      #p @calculator.errors.details
      #flash[:error] = "Validationerror while updating calculator"
      #render :edit, status: :unprocessable_entity
      #render status: :not_found
      #raise ArgumentError, 'Validationerror while updating calculator'
      
      if (@calculator.valid? == false)
        #p @calculator.title
        #p @calculator.errors.details
        #render :edit, status: :unprocessable_entity
        #p "You have no Title, Body or Status."
        p @calculator.errors.details
        render :edit, status: :unprocessable_entity        
        #when :count > 10
          #p @calculator.title
          #flash[:error] = "Calculator is too short"
          #render :edit, status: :unprocessable_entity
        #when :presence
          #p @calculator.title
          #flash[:error] = "You dont have a Title, Body or Status"
          #render :edit, status: :unprocessable_entity
        #end
        #raise ArgumentError, 'Validationerror while updating calculator'
        #flash[:notice] = "Validationerror while updating calculator"
        #render :edit, status: :unprocessable_entity
        #@calculator.valid?
        #redirect_to calculator_path(@calculator)    
      end
      #@calculator.update.errors[:title].any?                
    end
  
  end

  def destroy
    @calculator = Calculator.find(params[:id])
    @calculator.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def calculator_params
    params.require(:calculator).permit(:title, :body, :status)
  end
  
end


    #@new_calculation = Calculation.build_form( )

        #if(@calculator.errors[:presence])
          
          #render :edit, status: :unprocessable_entity
          #p "You have no Title, Body or Status."
        #else if @calculator.errors[:length]
          #render :edit, status: :unprocessable_entity
          #p 'Calculator is too short.'
        #else
          #render :edit, status: :unprocessable_entity
          #p  "Something went wrong."
        #end
        #end

      #case valid
      #when true
        #p "Your code is not working properly"
        #p @calculator.title
        #p @calculator.errors.details
        #p "your Title is too short"
      
      #when false
        #raise ArgumentError, 'Validationerror while updating calculator'
        #p @calculator.errors.details
        #p "your Title is too short"
        
      #end
        #if (@calculator.title.valid? == false)
          
          #raise ArgumentError, 'Error while updating the title'
        #end
