class AddContentToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :content, :string
  end
end
