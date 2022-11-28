class RemoveImagesFromDates < ActiveRecord::Migration[7.0]
  def change
    remove_column :dates, :images, :binary
  end
end
