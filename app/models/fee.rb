class Fee < ActiveRecord::Base
  has_many :clinics, :foreign_key => 'model_id'
end
