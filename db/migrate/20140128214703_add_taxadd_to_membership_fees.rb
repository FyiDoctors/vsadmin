class AddTaxaddToMembershipFees < ActiveRecord::Migration
  def change
    add_column :membership_fees, :taxadd, :decimal
  end
end
