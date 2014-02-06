class AddPrateToTax < ActiveRecord::Migration
  def change
    add_column :taxes, :prate, :decimal
  end
end
