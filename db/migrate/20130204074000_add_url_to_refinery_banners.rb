class AddUrlToRefineryBanners < ActiveRecord::Migration
  def change
    add_column :refinery_banners, :url, :string
  end
end
