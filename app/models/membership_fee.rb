class MembershipFee < ActiveRecord::Base
  belongs_to :clinic
  
  def clinic_name 
    clinic.name if clinic
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |fee|
        csv << fee.attributes.values_at(*column_names)
      end
    end
  end
end
