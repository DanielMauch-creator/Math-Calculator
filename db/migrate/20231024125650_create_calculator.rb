# frozen_string_literal: true

class CreateCalculator < ActiveRecord::Migration[7.0]
  def change
    create_table :calculator do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
