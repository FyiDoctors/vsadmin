class AddYearToMembershipFee < ActiveRecord::Migration
  def change
    add_column :membership_fees, :year, :integer
  end
end
