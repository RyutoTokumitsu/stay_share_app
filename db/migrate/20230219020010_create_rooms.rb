class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|

      t.string :hotel_image
      t.string :hotel_name
      t.text :introduction
      t.string :hotel_price
      t.string :address
      t.datetime :check_in
      t.datetime :check_out
      t.timestamps
    end
  end
end
