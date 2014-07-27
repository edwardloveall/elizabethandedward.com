class AddPlusOneToPeople < ActiveRecord::Migration
  def change
    add_column :people, :plus_one, :boolean, default: false
  end
end
