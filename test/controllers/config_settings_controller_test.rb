require 'test_helper'

class ConfigSettingsControllerTest < ActionController::TestCase
  setup do
    @config_setting = config_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:config_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config_setting" do
    assert_difference('ConfigSetting.count') do
      post :create, config_setting: { name: @config_setting.name, value: @config_setting.value }
    end

    assert_redirected_to config_setting_path(assigns(:config_setting))
  end

  test "should show config_setting" do
    get :show, id: @config_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @config_setting
    assert_response :success
  end

  test "should update config_setting" do
    patch :update, id: @config_setting, config_setting: { name: @config_setting.name, value: @config_setting.value }
    assert_redirected_to config_setting_path(assigns(:config_setting))
  end

  test "should destroy config_setting" do
    assert_difference('ConfigSetting.count', -1) do
      delete :destroy, id: @config_setting
    end

    assert_redirected_to config_settings_path
  end
end
