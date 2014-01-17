class AddVsidToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :vsid, :string
  end
end
