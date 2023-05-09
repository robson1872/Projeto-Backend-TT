class AddPasswordDigestToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :Password_disgest, :string
  end
end
