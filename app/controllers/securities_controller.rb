class SecuritiesController < ApplicationController
  before_action :set_security, only: [:show, :edit, :update, :destroy]
  layout "admin"


  # GET /securities
  # GET /securities.json
  def index
    @securities = Security.all
  end

  # GET /securities/1
  # GET /securities/1.json
  def show
    validate_user
  end

  # GET /securities/new
  def new
    @security = Security.new
    validate_user
  end

  # GET /securities/1/edit
  def edit
    validate_user
  end

  # POST /securities
  # POST /securities.json
  def create
    @security = Security.new(params[:security].permit(:secret))
    logger.debug("SECRET" + @security.secret)
    @membershipFee = MembershipFee.new
    @security_key = Security.find_by_secret(@security.secret)
    respond_to do |format|
      if @security_key != nil
        logged_in = session[:logged_in] = @security_key.role
        logger.debug("REDIRECTING")
        if(logged_in == "user")
          format.html { redirect_to new_membership_fee_path}
        else
          format.html { redirect_to reports_path}
        end
      else
        flash[:error] = 'The password you entered was invalid. Please try again.'
        format.html { redirect_to root_path}
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /securities/1
  # PATCH/PUT /securities/1.json
  def update
    respond_to do |format|
      if @security.update(security_params)
        format.html { redirect_to @security, notice: 'Security was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securities/1
  # DELETE /securities/1.json
  def destroy
    @security.destroy
    respond_to do |format|
      format.html { redirect_to securities_url }
      format.json { head :no_content }
    end
  end

  private
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

    # Use callbacks to share common setup or constraints between actions.
    def set_security
      @security = Security.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_params
      params.require(:security).permit(:secret)
    end
end
