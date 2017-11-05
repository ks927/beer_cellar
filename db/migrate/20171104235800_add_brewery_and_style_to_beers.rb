class AddBreweryAndStyleToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :brewery, :string
    add_column :beers, :style, :string
  end
end
