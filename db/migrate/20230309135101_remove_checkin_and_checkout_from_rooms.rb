class RemoveCheckinAndCheckoutFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :check_in, :datetime
    remove_column :rooms, :check_out, :datetime
  end
end
