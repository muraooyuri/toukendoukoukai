class CreateToukenComments < ActiveRecord::Migration[6.1]
  def change
    create_table :touken_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :touken_id

      t.timestamps
    end
  end
end
