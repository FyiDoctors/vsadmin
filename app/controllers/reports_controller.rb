class ReportsController < ApplicationController
  autocomplete :clinic, :name, :full => true
  before_action :validate_user
  layout "admin"
  
  def index
    @clinics = Clinic.all
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @years = ["2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"]
    
  end
  
  def show
    @mode = params[:mode]
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @years = ["2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"]
    if params[:status] != nil
      @status = params[:status]
    else
      @status = "active"
    end
    logger.debug("MODE: " + @mode)
    if @mode == "clinic"
      clinic_id = params[:clinic]
      @clinic = Clinic.find(clinic_id)
      @memeber_fees = MembershipFee.where(:clinic_id => @clinic.id, :record_status => @status).order(:created_at)
      logger.debug("results: " + @memeber_fees.count.to_s)
    elsif @mode == "month"
      @month = params[:month]
      @year = params[:year]
      @memeber_fees = MembershipFee.where(:month => @month, :year => @year, :record_status => @status)
    elsif @mode == "submit"
      @month = params[:month]
      @year = params[:year]

      startDate = Date.parse("1-" + @month + "-" + @year)
      endDate = startDate.to_time.advance(:months => 1).to_date
      
      logger.debug(startDate)
      @memeber_fees = MembershipFee.where(:created_at => startDate .. endDate, :record_status => @status)
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
