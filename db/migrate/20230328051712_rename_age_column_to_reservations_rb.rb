class RenameAgeColumnToReservationsRb < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :age, :people
  end
end
