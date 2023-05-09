class Add2PasswordDigestToUser < ActiveRecord::Migration[7.0]
  def change
    def change
      add_column :users, :password_disgest, :string
    end
  end
end
