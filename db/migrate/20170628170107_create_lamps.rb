class CreateLamps < ActiveRecord::Migration[5.1]
  def change
    create_table :lamps do |t|
      t.boolean :state

      t.timestamps
    end
  end
end
