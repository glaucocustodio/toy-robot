class CreateRobots < ActiveRecord::Migration[5.2]
  def change
    create_table :robots do |t|
      t.integer :position_x
      t.integer :position_y
      t.string :face

      t.timestamps
    end
  end
end
