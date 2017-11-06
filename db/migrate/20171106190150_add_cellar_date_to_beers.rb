class AddCellarDateToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :cellar_date, :datetime
  end
end
