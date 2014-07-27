class AddPlusOneToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :allow_plus_one, :boolean, default: false
    add_column :invites, :plus_one_at, :datetime
  end
end
