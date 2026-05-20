class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :start_datetime, :duration, presence: true

  scope :from_airport, ->(airport_id) { where(departure_airport_id: airport_id) if airport_id.present? }
  scope :to_airport, ->(airport_id) { where(arrival_airport_id: airport_id) if airport_id.present? }

  scope :on_date, ->(date) { where(start_datetime: date.to_date.all_day) if date.present? }
end
