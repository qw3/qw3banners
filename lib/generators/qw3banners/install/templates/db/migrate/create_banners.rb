class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :link
      t.integer :ordem
      t.boolean :publicado, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
