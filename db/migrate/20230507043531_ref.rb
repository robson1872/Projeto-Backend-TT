class Ref < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.datetime :answered_at
      t.timestamps
    end

    create_table :questions do |t|
      t.string :name
      t.datetime :question_type
      t.timestamps
    end

    add_reference :answers, :formulary, index: true, foreign_key: true
  end
end
