class ChangeDatatypeBrandOfCloths < ActiveRecord::Migration[5.2]
  def change
  	change_column :cloths, :brand, :string
  end
end
