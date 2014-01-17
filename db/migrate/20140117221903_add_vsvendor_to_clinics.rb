class AddVsvendorToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :vsvendorid, :string
  end
end
