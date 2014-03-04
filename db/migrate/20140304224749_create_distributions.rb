class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :email

      t.timestamps
    end
  end
end
