class MembershipFee < ActiveRecord::Base
  belongs_to :clinic
  before_save :default_values

  def clinic_name 
    clinic.name if clinic
  end
  
  def self.to_csv
    CSV.generate do |csv|
#      csv << column_names
      csv << ["Submit Id", "Clinic Name", "Vendor Id", "Month", "Year", "Credit Card", "Refunds", "Tax", "Fees", "Check Number"]
      all.each do |fee|
#        csv << fee.attributes.values_at(*column_names)
        csv << [fee.id, fee.clinic.name, fee.clinic.vendorid, fee.month, fee.year, fee.creditcard, fee.refunds, fee.tax, fee.fee, fee.checknumber]
      end
    end
  end
  def default_values
    self.receipts ||= 0
    self.creditcard ||= 0
    self.refunds ||= 0
    self.tax ||= 0
    self.fee ||= 0
  end
  
end
