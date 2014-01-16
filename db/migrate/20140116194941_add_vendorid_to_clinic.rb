class AddVendoridToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :vendorid, :string
  end
end
