class AddImageUrlToTwitterDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :twitter_data, :url, :string
  end
end
