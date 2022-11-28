class AddCoupleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :couple, :references
  end
end
