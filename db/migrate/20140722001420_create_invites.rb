class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.timestamps
      t.string :email
    end
  end
end
