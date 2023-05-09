class Remove3PasswordDigestFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_digest, :string
    add_column :users, :password, :string
  end
end
