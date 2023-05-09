class Ref2 < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :question, index: true, foreign_key: true
    add_reference :questions, :formulary, index: true, foreign_key: true
  end
end
