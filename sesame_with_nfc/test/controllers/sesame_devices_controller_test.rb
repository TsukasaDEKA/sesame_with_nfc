require 'test_helper'

class SesameDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sesame_device = sesame_devices(:one)
  end

  test "should get index" do
    get sesame_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_sesame_device_url
    assert_response :success
  end

  test "should create sesame_device" do
    assert_difference('SesameDevice.count') do
      post sesame_devices_url, params: { sesame_device: { device_id: @sesame_device.device_id, nickname: @sesame_device.nickname, organization_id: @sesame_device.organization_id, serial: @sesame_device.serial } }
    end

    assert_redirected_to sesame_device_url(SesameDevice.last)
  end

  test "should show sesame_device" do
    get sesame_device_url(@sesame_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_sesame_device_url(@sesame_device)
    assert_response :success
  end

  test "should update sesame_device" do
    patch sesame_device_url(@sesame_device), params: { sesame_device: { device_id: @sesame_device.device_id, nickname: @sesame_device.nickname, organization_id: @sesame_device.organization_id, serial: @sesame_device.serial } }
    assert_redirected_to sesame_device_url(@sesame_device)
  end

  test "should destroy sesame_device" do
    assert_difference('SesameDevice.count', -1) do
      delete sesame_device_url(@sesame_device)
    end

    assert_redirected_to sesame_devices_url
  end
end
