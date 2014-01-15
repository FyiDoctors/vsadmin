class AddClinicToMembershipFee < ActiveRecord::Migration
  def change
    add_column :membership_fees, :clinic_id, :integer
  end
end
