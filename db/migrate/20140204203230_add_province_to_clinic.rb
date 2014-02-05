class AddProvinceToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :province, :string
  end
end
