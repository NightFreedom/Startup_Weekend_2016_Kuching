class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :name
      t.string :car_plate
      t.string :year
      t.string :manufacturer
      t.string :model
      t.boolean :accident
      t.string :owner
      t.string :client
      t.boolean :rented
      t.float :payment
      t.integer :cc
      t.integer :used

      t.timestamps null: false
    end
  end
end
