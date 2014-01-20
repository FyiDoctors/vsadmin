class AddModelidToFees < ActiveRecord::Migration
  def change
    add_column :fees, :model_id, :integer
  end
end
