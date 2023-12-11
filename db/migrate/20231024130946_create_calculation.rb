# frozen_string_literal: true

class CreateCalculation < ActiveRecord::Migration[7.0]
  def change
    create_table :calculation do |t|
      t.integer :number_one
      t.integer :number_two
      t.string :arithmetic
      t.integer :result
      t.references :calculator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
