# frozen_string_literal: true

# a class Calculation for doing Calculation
class Calculation < ApplicationRecord
  include Visible
  
  validates :number_one, length: { minimum: 1 }, presence: true, numericality: true
  validates :number_two, length: { minimum: 1 }, presence: true, numericality: true
  VALID_ARITHMETICS = %w[addition subtraction multiplication division].freeze
  validates :arithmetic, inclusion: { in: VALID_ARITHMETICS }, length: { minimum: 8 }, presence: true
  belongs_to :calculator
  before_save :do_calculation, if: proc { number_one.present? && number_two.present? && arithmetic.present? }


  
  def addition
    number_one + number_two
  end

  def subtraction
    number_one - number_two
  end

  def multiplication
    number_one * number_two
  end

  def division
    number_one / number_two
  end

  def do_calculation
    self.result = case arithmetic
                  when 'addition'
                    addition
                  when 'subtraction'
                    subtraction
                  when 'multiplication'
                    multiplication
                  when 'division'
                    division
                  end
  end
end

    #def self.build_from(calculation_id, number_one, number_two, arithmetic)
     #new \
        #:calculation_id => calculation_id,
        #:number_one  => number_one,
        #:number_two   => number_two,
        #:arithmetic  => arithmetic
  #end
