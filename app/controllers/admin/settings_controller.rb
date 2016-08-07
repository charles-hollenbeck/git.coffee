class Admin::SettingsController < AdminController
  layout "admin_login"
  before_action :set_setting, only: [:edit, :update]

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all
  end

  # GET /settings/1/edit
  def edit
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to admin_settings_path, notice: 'Setting was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:value)
    end
end
