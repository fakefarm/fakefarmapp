class CreateVerses < ActiveRecord::Migration[5.0]
  def change
    create_table :verses do |t|
      t.string :book
      t.string :chapter
      t.string :verse
      t.string :translation

      t.timestamps
    end
  end
end
