require "application_system_test_case"

class DoorLogsTest < ApplicationSystemTestCase
  setup do
    @door_log = door_logs(:one)
  end

  test "visiting the index" do
    visit door_logs_url
    assert_selector "h1", text: "Door Logs"
  end

  test "creating a Door log" do
    visit door_logs_url
    click_on "New Door Log"

    fill_in "After door status", with: @door_log.after_door_status
    fill_in "Before door status", with: @door_log.before_door_status
    fill_in "Sesame device", with: @door_log.sesame_device_id
    fill_in "User", with: @door_log.user_id
    click_on "Create Door log"

    assert_text "Door log was successfully created"
    click_on "Back"
  end

  test "updating a Door log" do
    visit door_logs_url
    click_on "Edit", match: :first

    fill_in "After door status", with: @door_log.after_door_status
    fill_in "Before door status", with: @door_log.before_door_status
    fill_in "Sesame device", with: @door_log.sesame_device_id
    fill_in "User", with: @door_log.user_id
    click_on "Update Door log"

    assert_text "Door log was successfully updated"
    click_on "Back"
  end

  test "destroying a Door log" do
    visit door_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Door log was successfully destroyed"
  end
end
