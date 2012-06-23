class AddTituloToBanner < ActiveRecord::Migration
  def change
    add_column :banners, :titulo, :string
  end
end
