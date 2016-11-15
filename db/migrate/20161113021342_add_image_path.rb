class AddImagePath < ActiveRecord::Migration
  def change
      add_column :transports, :image_path, :binary
      add_column :transports, :image_name, :string
  end
end
