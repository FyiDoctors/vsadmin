class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.decimal :from
      t.decimal :to
      t.decimal :fee

      t.timestamps
    end
  end
end
