class FlightsController < ApplicationController
  def index
    @flight_dates = Flight.where("start_datetime >= ?", Time.zone.now.beginning_of_day).order(:start_datetime).pluck(:start_datetime).map { |dt| dt.to_date }.uniq.map { |date| [ "#{date.strftime('%a')}, #{date.strftime('%d').to_i.ordinalize} of #{date.strftime('%B %Y')}", date ] }

    if params[:from_airport].present? && params[:to_airport].present? && params[:date].present?
      @flights = Flight.from_airport(params[:from_airport]).to_airport(params[:to_airport]).on_date(params[:date]).order(:start_datetime)
    else
      @flights = []
    end
  end
end
