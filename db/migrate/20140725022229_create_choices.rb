class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.timestamps
      t.boolean :attending
      t.integer :meal
      t.boolean :friday
      t.references :person, index: true
    end
  end
end
