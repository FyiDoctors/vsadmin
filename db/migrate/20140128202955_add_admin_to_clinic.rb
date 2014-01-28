class AddAdminToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :admin, :boolean
  end
end
