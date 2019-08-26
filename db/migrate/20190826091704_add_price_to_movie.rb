class AddPriceToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :price, :integer
  end
end
