class CreateDates < ActiveRecord::Migration[7.0]
  def change
    create_table :dates do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :cost
      t.time :time
      t.binary :images

      t.timestamps
    end
  end
end
