class ReportsController < ApplicationController
  autocomplete :clinic, :name, :full => true
  before_action :validate_user

  def index
    @clinics = Clinic.all
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @years = ["2013", "2014"]
    
  end
  
  def show
    @mode = params[:mode]
    logger.debug("MODE: " + @mode)
    if @mode == "clinic"
      clinic_id = params[:clinic]
      @clinic = Clinic.find(clinic_id)
      @memeber_fees = MembershipFee.where(:clinic_id => @clinic.id)
      logger.debug("results: " + @memeber_fees.count.to_s)
    else
      @month = params[:month]
      @year = params[:year]
      @memeber_fees = MembershipFee.where(:month => @month, :year => @year)
    end
    
    respond_to do |format|
        format.html
        format.csv { send_data @memeber_fees.to_csv }
      end
  end
  def validate_user
    logged_in = session[:logged_in]
    logger.debug("validate user")
    if logged_in == nil || logged_in != "admin"
      redirect_to "/admin.html"
      return false
    else
      logger.debug("session: " + logged_in)
    end
    return true
  end
end
