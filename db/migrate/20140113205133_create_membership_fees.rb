class CreateMembershipFees < ActiveRecord::Migration
  def change
    create_table :membership_fees do |t|
      t.decimal :receipts
      t.decimal :creditcard
      t.decimal :refunds
      t.decimal :tax
      t.string :month
      t.integer :checknumber

      t.timestamps
    end
  end
end
