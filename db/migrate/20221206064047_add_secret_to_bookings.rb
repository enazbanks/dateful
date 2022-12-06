class AddSecretToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :secret_instructions, :text
  end
end
