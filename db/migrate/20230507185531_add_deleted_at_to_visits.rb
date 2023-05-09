class AddDeletedAtToVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.string :status
      t.datetime :data
      t.datetime :checkin_at
      t.datetime :checkout_at
      t.timestamps
    end

    add_column :visits, :deleted_at, :datetime
    add_index :visits, :deleted_at
  end
end
