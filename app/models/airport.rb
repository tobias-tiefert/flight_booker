class Airport < ApplicationRecord
  has_many :arriving_flights, foreign_key: "arrival_airport_id", class_name: "Flight", inverse_of: "arrival_airport", dependent: :destroy
  has_many :departing_flights, foreign_key: "depature_airport_id", class_name: "Flight", inverse_of: "depature_airport", dependent: :destroy

  validates :code, presence: true, uniqueness: true, length: { is: 3 }
end
