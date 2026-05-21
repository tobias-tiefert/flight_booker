class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :start_datetime, :duration, presence: true

  scope :from_airport, ->(airport_id) { where(departure_airport_id: airport_id) if airport_id.present? }
  scope :to_airport, ->(airport_id) { where(arrival_airport_id: airport_id) if airport_id.present? }

  scope :on_date, ->(date) { where(start_datetime: date.to_date.all_day) if date.present? }

  def arrival_datetime
    start_datetime + duration.minutes
  end

  def duration_in_words
    hours = duration / 60
    minutes = duration % 60
    word_minutes = minutes == 1 ? "minute" : "minutes"
    if hours == 0
      "#{minutes} #{word_minutes}"
    elsif hours == 1
      "#{hours} hour #{minutes} #{word_minutes}"
    else
      "#{hours} hours #{minutes} #{word_minutes}"
    end
  end

  def price_in_euro
    "#{'%.2f' % (price/100.0)} €"
  end
end
