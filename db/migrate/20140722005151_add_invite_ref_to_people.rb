class AddInviteRefToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :invite, index: true
  end
end
