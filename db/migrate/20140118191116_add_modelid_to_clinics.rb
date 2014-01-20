class AddModelidToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :model_id, :integer
  end
end
