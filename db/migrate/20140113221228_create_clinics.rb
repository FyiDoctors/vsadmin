class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :doctor

      t.timestamps
    end
  end
end
