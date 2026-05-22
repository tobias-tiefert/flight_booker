class AddPriceToFlight < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :price, :integer
  end
end
