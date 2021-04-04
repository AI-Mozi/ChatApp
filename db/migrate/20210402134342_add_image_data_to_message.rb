class AddImageDataToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :image_data, :text
  end
end
