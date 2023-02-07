class CreateToukens < ActiveRecord::Migration[6.1]
  def change
    create_table :toukens do |t|
      t.string :title
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
end
