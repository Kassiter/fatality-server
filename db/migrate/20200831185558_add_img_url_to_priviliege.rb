class AddImgUrlToPriviliege < ActiveRecord::Migration[6.0]
  def change
    add_column :privilieges, :img_url, :string, default: ''
  end
end
