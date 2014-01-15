class AddRoleToSecurity < ActiveRecord::Migration
  def change
    add_column :securities, :role, :string
  end
end
