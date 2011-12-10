class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.belongs_to :user
      t.string :name
      t.string :url
      t.string :time_zone
      t.string :token

      t.timestamps
    end
    add_index :sites, :user_id
    add_index :sites, :token
  end
end
