class AddDateToBeer < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :date, :datetime
  end
end
