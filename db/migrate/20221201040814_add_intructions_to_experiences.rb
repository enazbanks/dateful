class AddIntructionsToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :instructions, :text
    add_column :experiences, :secret_instructions, :text
  end
end
