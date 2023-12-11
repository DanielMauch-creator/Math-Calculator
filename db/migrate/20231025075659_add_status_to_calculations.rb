# frozen_string_literal: true

class AddStatusToCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :calculation, :status, :string
  end
end
