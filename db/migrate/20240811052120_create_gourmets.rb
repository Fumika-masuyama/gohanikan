class CreateGourmets < ActiveRecord::Migration[6.1]
  def change
    create_table :gourmets do |t|
      t.string :name
      t.integer :number
      t.string :purpose
      t.string :place
      t.integer :budget
      t.string :genre
      t.datetime :time

      t.timestamps
    end
  end
end
