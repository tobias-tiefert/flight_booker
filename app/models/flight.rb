class Flight < ApplicationRecord
  belongs_to :depature_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :start_datetime, :duration, presence: true
end
