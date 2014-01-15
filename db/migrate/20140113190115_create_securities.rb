class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :secret

      t.timestamps
    end
  end
end
