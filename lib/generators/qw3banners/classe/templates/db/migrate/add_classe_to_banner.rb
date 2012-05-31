class AddClasseToBanner < ActiveRecord::Migration
  def change
    add_column :banners, :classe, :string
  end
end
