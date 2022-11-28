class AddCoupleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :couple
  end
end
