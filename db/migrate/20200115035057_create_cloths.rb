class CreateCloths < ActiveRecord::Migration[5.2]
  def change
    create_table :cloths do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :brand
      t.string :size
      t.string :image_id

      t.timestamps
    end
  end
end
