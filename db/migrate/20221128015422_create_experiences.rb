class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :cost
      t.string :time

      t.timestamps
    end
  end
end
