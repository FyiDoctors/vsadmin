class AddStatusToMembershipFees < ActiveRecord::Migration
  def change
    add_column :membership_fees, :record_status, :string, :null => false, :default => 'active'
  end
end
