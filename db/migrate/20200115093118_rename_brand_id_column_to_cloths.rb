class RenameBrandIdColumnToCloths < ActiveRecord::Migration[5.2]
  def change
  	rename_column :cloths, :brand_id, :brand
  end
end