class MembershipFee < ActiveRecord::Base
  belongs_to :clinic
  before_save :default_values
  validates :clinic_id, presence: true
  
  def clinic_name 
    clinic.name if clinic
  end
  
  def self.to_csv
    CSV.generate do |csv|
#      csv << column_names
      csv << ["Submit Id", "Vision Source Id", "Vendor Id" ,"Clinic Name", "Address", "Month", "Year", "Receipts", "Credit Card", "Refunds", "Tax", "Fees"]
      all.each do |fee|
#        csv << fee.attributes.values_at(*column_names)
        csv << [fee.id, fee.clinic.vsid, fee.clinic.vendorid, fee.clinic.name, fee.clinic.address, fee.month, fee.year, fee.receipts, fee.creditcard, fee.refunds, fee.tax, fee.fee]
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
