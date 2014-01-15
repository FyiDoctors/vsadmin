class AddFeeToMembershipFee < ActiveRecord::Migration
  def change
    add_column :membership_fees, :fee, :decimal
  end
end
