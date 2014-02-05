class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :province
      t.decimal :rate

      t.timestamps
    end
  end
end
