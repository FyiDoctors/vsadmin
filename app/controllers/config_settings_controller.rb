class ConfigSettingsController < ApplicationController
  before_action :set_config_setting, only: [:show, :edit, :update, :destroy]
  #before_action :validate_user

  # GET /config_settings
  # GET /config_settings.json
  def index
    @config_settings = ConfigSetting.all
  end

  # GET /config_settings/1
  # GET /config_settings/1.json
  def show
  end

  # GET /config_settings/new
  def new
    @config_setting = ConfigSetting.new
  end

  # GET /config_settings/1/edit
  def edit
  end

  # POST /config_settings
  # POST /config_settings.json
  def create
    @config_setting = ConfigSetting.new(config_setting_params)

    respond_to do |format|
      if @config_setting.save
        format.html { redirect_to @config_setting, notice: 'Config setting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @config_setting }
      else
        format.html { render action: 'new' }
        format.json { render json: @config_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_settings/1
  # PATCH/PUT /config_settings/1.json
  def update
    respond_to do |format|
      if @config_setting.update(config_setting_params)
        format.html { redirect_to @config_setting, notice: 'Config setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @config_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_settings/1
  # DELETE /config_settings/1.json
  def destroy
    @config_setting.destroy
    respond_to do |format|
      format.html { redirect_to config_settings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_setting
      @config_setting = ConfigSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_setting_params
      params.require(:config_setting).permit(:name, :value)
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
