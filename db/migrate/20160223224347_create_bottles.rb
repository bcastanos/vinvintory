class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.integer :qty
      t.integer :vintage
      t.string :wine
      t.integer :price

      t.timestamps null: false
    end
  end
end
