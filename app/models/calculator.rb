# frozen_string_literal: true

# a parent class of Calculation
class Calculator < ApplicationRecord
  include Visible
  has_many :calculations, dependent: :destroy
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true

            
end
