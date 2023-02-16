class AddGenreRefToToukens < ActiveRecord::Migration[6.1]
  def change
    add_reference :toukens, :genre, :string, null: false, foreign_key: true
  end
end
