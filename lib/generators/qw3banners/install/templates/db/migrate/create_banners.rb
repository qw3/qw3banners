class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :link
      t.integer :ordem
      t.boolean :publicado, :default => 1
      t.string :imagem_file_name
      t.string :imagem_content_type
      t.integer :imagem_file_size
      t.datetime :imagem_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end