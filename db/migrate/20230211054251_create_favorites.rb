class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :touken_id

      t.timestamps
      t.index [:user_id, :touken_id], unique: true
    end
  end
end
