class ChangeTimeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :dates, :time, :string
  end
end
