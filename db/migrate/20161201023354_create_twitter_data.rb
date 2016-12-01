class CreateTwitterData < ActiveRecord::Migration[5.0]
  def change
    create_table :twitter_data do |t|
      t.string :screen_name
      t.date :created_at
      t.integer :followers_count
      t.integer :statuses_count
      t.string :id_str
      t.text :last_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
