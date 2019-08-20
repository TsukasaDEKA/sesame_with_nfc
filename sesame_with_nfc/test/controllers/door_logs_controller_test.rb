require 'test_helper'

class DoorLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @door_log = door_logs(:one)
  end

  test "should get index" do
    get door_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_door_log_url
    assert_response :success
  end

  test "should create door_log" do
    assert_difference('DoorLog.count') do
      post door_logs_url, params: { door_log: { after_door_status: @door_log.after_door_status, before_door_status: @door_log.before_door_status, sesame_device_id: @door_log.sesame_device_id, user_id: @door_log.user_id } }
    end

    assert_redirected_to door_log_url(DoorLog.last)
  end

  test "should show door_log" do
    get door_log_url(@door_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_door_log_url(@door_log)
    assert_response :success
  end

  test "should update door_log" do
    patch door_log_url(@door_log), params: { door_log: { after_door_status: @door_log.after_door_status, before_door_status: @door_log.before_door_status, sesame_device_id: @door_log.sesame_device_id, user_id: @door_log.user_id } }
    assert_redirected_to door_log_url(@door_log)
  end

  test "should destroy door_log" do
    assert_difference('DoorLog.count', -1) do
      delete door_log_url(@door_log)
    end

    assert_redirected_to door_logs_url
  end
end
