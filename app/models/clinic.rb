class Clinic < ActiveRecord::Base
  has_many :fees, :foreign_key => 'model_id'
end
