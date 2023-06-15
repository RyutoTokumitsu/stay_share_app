class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room, class_name: "Room", foreign_key: "room_id"

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :people, presence: true, numericality: { greater_than: 0 }

  def total_nights
    (check_out.to_date - check_in.to_date).to_i
  end
end
