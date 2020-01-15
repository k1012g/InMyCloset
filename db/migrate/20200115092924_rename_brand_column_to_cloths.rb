class RenameBrandColumnToCloths < ActiveRecord::Migration[5.2]
  def change
  	rename_column :cloths, :brand, :brand_id
  end
end
