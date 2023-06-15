class RenameReservationIdToUserIdInReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :reservation_id, :user_id
  end
end
