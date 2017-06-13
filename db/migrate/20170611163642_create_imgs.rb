class CreateImgs < ActiveRecord::Migration[5.1]
  def change
    create_table :imgs do |t|
      t.text :image_data

      t.timestamps
    end
  end
end
