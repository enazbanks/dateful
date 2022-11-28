class CreateSpecialDays < ActiveRecord::Migration[7.0]
  def change
    create_table :special_days do |t|
      t.references :couple, null: false, foreign_key: true
      t.date :date
      t.string :title
      t.timestamps
    end
  end
end
