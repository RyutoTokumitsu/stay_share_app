class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room, class_name: "Room", foreign_key: "room_id"

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :people, numericality: true, presence: true
end
