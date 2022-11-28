class CreateSpecialDays < ActiveRecord::Migration[7.0]
  def change
    create_table :special_days do |t|

      t.timestamps
    end
  end
end
