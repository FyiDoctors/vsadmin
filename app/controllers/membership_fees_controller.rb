class MembershipFeesController < ApplicationController
  require 'mandrill'
  include ActionView::Helpers::NumberHelper
  autocomplete :clinic, :name, :full => true
  before_action :set_membership_fee, only: [:show, :edit, :update, :destroy]
  before_action :validate_user
  
  # GET /membership_fees
  # GET /membership_fees.json
  def index 
    clinicId = params["clinic"]
    month = params["month"]
    year = params["year"]
    
    logger.debug("CLINIC: " + clinicId)
    @memberhip_fees = MembershipFee.where(:clinic_id => clinicId, :month => month, :year => year)
    logger.debug("c" + @memberhip_fees.count.to_s)
  end

  # GET /membership_fees/1
  # GET /membership_fees/1.json
  def show
  end

  # GET /membership_fees/new
  def new
    @membership_fee = MembershipFee.new
    @clinics = Clinic.all
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @years = ["2013", "2014", "2015", "2016"]
    @feesA = Fee.where(:model_id => 1)
    @feesB = Fee.where(:model_id => 2)
  end

  # GET /membership_fees/1/edit
  def edit
  end

  # PATCH/PUT /membership_fees/1
  # PATCH/PUT /membership_fees/1.json
  def update
    respond_to do |format|
      if @membership_fee.update(membership_fee_params)
        format.html { render action: 'index', status: 200 }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @membership_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /membership_fees
  # POST /membership_fees.json
  def create
    @membership_fee = MembershipFee.new(membership_fee_params)
    emailAddress = params[:clinic_email].to_s
    
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @years = ["2013", "2014"]
    @feesA = Fee.where(:model_id => 1)
    @feesB = Fee.where(:model_id => 2)

    @membership_fee.clinic.email = emailAddress
    
    respond_to do |format|
      if @membership_fee.save
        m = Mandrill::API.new # All official Mandrill API clients will automatically pull your API key from the environment

        body = "<h2>Thank you for submitting your member data.</h2> \
        <br> \
        <p>The following is a summary of what is required for remittance.</p> \
        <br> \
        <p>Cheques should be made payable to Vision Source Canada. Please include your confirmation number [VS-00" + @membership_fee.id.to_s + "] on your check. Payment is due 45 days after month-end. We also recommend printing a copy of this confirmation receipt for your records.</p> \
        <span style='font-weight: bold'>Send to:</span> \
        <br><br> \
        <p>Confirmation Number <span style='font-weight: bold'>VS-00" + @membership_fee.id.to_s + "</span></p> \
        <span style='font-weight: bold'>" + @membership_fee.clinic.name + "</span> \
        <p style='padding-left: 20px'>" + @membership_fee.clinic.address + "</p> \
      	<div>Vision Source Location Id:  \
      	<span style='font-weight: bold'> " + @membership_fee.clinic.vsid + "</span> \
        </div> \
        <div>Vendor Id: \
      	<span style='font-weight: bold'> " + @membership_fee.clinic.vendorid + "</span> \
        </div> \
        <hr>
        <div>Receipts:  " + number_to_currency(@membership_fee.receipts) + "</div> \
        <div style='padding-left: 20px'>Less Credit Card Processing Fee: " + number_to_currency(@membership_fee.creditcard) + "</div> \        
        <div style='padding-left: 20px'>Less Refunds to Patients: " + number_to_currency(@membership_fee.refunds) + "</div> \        
        <div style='padding-left: 20px'>Less Sales Tax Paid by Patient: " + number_to_currency(@membership_fee.tax) + "</div> \        
        <div>Adjusted Gross Receipts: " + number_to_currency(@membership_fee.receipts - @membership_fee.creditcard - @membership_fee.refunds - @membership_fee.tax) + "</div> \        
        <hr>
        <div>Base Fee:  " + number_to_currency(@membership_fee.fee - @membership_fee.taxadd) + "</div> \
        <div>Provincial Taxes:  " + number_to_currency(@membership_fee.taxadd) + "</div> \
        <div style='font-weight: bold'>Membership Fee Due:  " + number_to_currency(@membership_fee.fee) + " </div>"
        
        distros = Distribution.all
        recipients = Array.new
        mode = ConfigSetting.where(:name=>"mode")
        logger.debug("MODE: " + mode.first.value)
        if mode.first.value == "test"
          logger.debug("TEST MODE")
          email = ConfigSetting.find(:first, :conditions=>["name= ?", "email"])
          recipients[0] = {"email"=> email.value, "type"=>"to"}
        elsif mode.first.value == "prod"
          logger.debug("PROD MODE")
          if @membership_fee.clinic.email == ""
            recipients[0] = {"email"=> distros.first.email, "type"=>"to"}                        
            logger.debug("BLANK EMAIL: " + recipients[0].to_s)
          else
            recipients[0] = {"email"=> @membership_fee.clinic.email, "type"=>"to"}            
            logger.debug("CLINIC EMAIL: " + recipients[0].to_s)
          end
        end

        i = 1
        distros.each do |d|
          recipients[i] = {"email"=> d.email, "type"=>"cc"}
          i = i + 1
        end

        message = {"html"=>body,
             "text"=>"text email todo",
             "subject"=>"Fee Submission for " + @membership_fee.month + ", " + @membership_fee.year.to_s,
             "from_email"=>"noreply@visionsource.ca",
             "from_name"=>"Vision Source Canada - Fees",
             "to"=> recipients,
             "headers"=>{"Reply-To"=>"noreply@visionsource.ca"},
             "important"=>false,
             "track_opens"=>nil,
             "track_clicks"=>nil,
             "auto_text"=>nil,
             "auto_html"=>nil,
             "inline_css"=>nil,
             "url_strip_qs"=>nil,
             "preserve_recipients"=>nil,
             "view_content_link"=>nil,
             "bcc_address"=>nil,
             "tracking_domain"=>nil,
             "signing_domain"=>nil,
             "return_path_domain"=>nil,
             "metadata"=>{"website"=>"www.visionsource.ca"},
             "recipient_metadata"=>
                [{"rcpt"=>"Aleksandra.Cekic@visionsource.ca", "values"=>{"user_id"=>123456}},
                {"rcpt"=>"michael.vandenheever@fyidoctors.com", "values"=>{"user_id"=>123456}}]}
                
            async = false
            ip_pool = "Main Pool"
            send_at = nil
            logger.debug(message.to_s)
            result = m.messages.send message, async, ip_pool, send_at
            logger.debug(result)

        format.html { redirect_to @membership_fee, notice: 'Membership fee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @membership_fee }
      else
        format.html { render action: 'new' }
        format.json { render json: @membership_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_fee
      @membership_fee = MembershipFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_fee_params
      params.require(:membership_fee).permit(:receipts, :creditcard, :refunds, :tax, :year, :fee, :month, :checknumber, :clinic_id, :taxadd, :record_status)
    end
    
    def validate_user
      current_uri = request.env['PATH_INFO']
      if current_uri == "/"
        return true
      else
        logged_in = session[:logged_in]
        logger.debug("validate user")
        if logged_in == nil
          redirect_to root_path
          return false
        else
          logger.debug("session: " + logged_in)
        end
        return true
      end
    end

end
