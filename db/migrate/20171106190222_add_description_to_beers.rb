class AddDescriptionToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :description, :text
  end
end
