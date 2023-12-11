# frozen_string_literal: true

class AddStatusToCalculators < ActiveRecord::Migration[7.0]
  def change
    add_column :calculator, :status, :string
  end
end
