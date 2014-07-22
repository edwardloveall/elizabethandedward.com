class Person < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.timestamps
      t.string :name
    end
  end
end
