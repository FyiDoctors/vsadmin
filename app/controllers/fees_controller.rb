class FeesController < ApplicationController
  before_action :set_fee, only: [:show, :edit, :update, :destroy]
  before_action :validate_user

  # GET /fees
  # GET /fees.json
  def index
    @fees = Fee.all
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
  end

  # GET /fees/new
  def new
    @fee = Fee.new
  end

  # GET /fees/1/edit
  def edit
  end

  # POST /fees
  # POST /fees.json
  def create
    @fee = Fee.new(fee_params)

    respond_to do |format|
      if @fee.save
        format.html { redirect_to @fee, notice: 'Fee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fee }
      else
        format.html { render action: 'new' }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fees/1
  # PATCH/PUT /fees/1.json
  def update
    respond_to do |format|
      if @fee.update(fee_params)
        format.html { redirect_to @fee, notice: 'Fee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee.destroy
    respond_to do |format|
      format.html { redirect_to fees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee
      @fee = Fee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_params
      params.require(:fee).permit(:from, :to, :fee)
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
