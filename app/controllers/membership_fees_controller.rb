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
    @fees = Fee.all;

    @fees1 = [['-', '10,000', '75.00'],
      ['10,000', '30,000', '300.00'],
      ['30,000', '50,000', '600.00'],
      ['50,000', '70,000', '900.00'],
      ['70,000', '90,000', '1,200.00'],
      ['90,000', '110,000', '1,500.00'],
      ['110,000', '130,000', '1,800.00'],
      ['130,000', '150,000', '2,100.00'],
      ['150,000', '175,000', '2,450.00'],
      ['175,000', '200,000', '2,825.00'],
      ['200,000', '225,000', '3,200.00']
    ]
    @fees2 = [['225,000', '250,000', '3,575.00'],
      ['250,000', '275,000', '3,950.00'],
      ['275,000', '300,000', '4,325.00'],
      ['300,000', '325,000', '4,700.00'],
      ['325,000', '350,000', '5,075.00'],
      ['350,000', '375,000', '5,450.00'],
      ['375,000', '400,000', '5,825.00'],
      ['400,000', '425,000', '6,200.00'],
      ['425,000', '450,000', '6,575.00'],
      ['450,000', '475,000', '6,950.00'],
      ['475,000', '500,000', '7,325.00'],
    ]
  end

  # GET /membership_fees/1/edit
  def edit
  end

  # POST /membership_fees
  # POST /membership_fees.json
  def create
    @membership_fee = MembershipFee.new(membership_fee_params)

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
