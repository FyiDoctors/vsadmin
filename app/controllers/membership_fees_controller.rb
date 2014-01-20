class MembershipFeesController < ApplicationController
  autocomplete :clinic, :name, :full => true
  before_action :set_membership_fee, only: [:show, :edit, :update, :destroy]
  before_action :validate_user
  
  # GET /membership_fees
  # GET /membership_fees.json

  # GET /membership_fees/1
  # GET /membership_fees/1.json
  def show
  end

  # GET /membership_fees/new
  def new
    @membership_fee = MembershipFee.new
    @clinics = Clinic.all
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @years = ["2013", "2014"]
    @feesA = Fee.where(:model_id => 1)
    @feesB = Fee.where(:model_id => 2)
  end

  # GET /membership_fees/1/edit
  def edit
  end

  # POST /membership_fees
  # POST /membership_fees.json
  def create
    @membership_fee = MembershipFee.new(membership_fee_params)
    @clinics = Clinic.all
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @years = ["2013", "2014"]
    @feesA = Fee.where(:model_id => 1)
    @feesB = Fee.where(:model_id => 2)
    
    respond_to do |format|
      if @membership_fee.save
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
      params.require(:membership_fee).permit(:receipts, :creditcard, :refunds, :tax, :year, :fee, :month, :checknumber, :clinic_id)
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
