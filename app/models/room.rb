class Room < ApplicationRecord
  has_many :reservations, class_name: "Reservation", foreign_key: "room_id"

  validates :hotel_name, presence: true
  validates :introduction, length: {maximum: 30}, presence: true
  validates :hotel_price, numericality: true, presence: true
  validates :address, presence: true
end
