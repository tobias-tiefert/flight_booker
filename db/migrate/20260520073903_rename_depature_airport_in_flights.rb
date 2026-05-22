class RenameDepatureAirportInFlights < ActiveRecord::Migration[8.1]
  def change
    # 1. Entfernt die fehlerhafte Spalte samt Foreign Key und Index vollständig
    remove_reference :flights, :depature_airport, foreign_key: { to_table: :airports }

    # 2. Erstellt die Spalte neu mit der korrekten Schreibweise und allen Bedingungen
    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
  end
end
