class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :when
      t.text :instructions
      t.boolean :suprise
      t.integer :status
      t.references :date, null: false, foreign_key: true
      t.references :couple, null: false, foreign_key: true

      t.timestamps
    end
  end
end
