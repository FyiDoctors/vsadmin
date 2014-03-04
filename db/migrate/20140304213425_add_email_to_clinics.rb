class AddEmailToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :email, :string
  end
end
