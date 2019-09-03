class ChangeImgUrlToDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :comedians, :img_url, :string, default: "https://comps.gograph.com/ggb/66561281" 
  end
end
