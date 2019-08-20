require "application_system_test_case"

class SesameDevicesTest < ApplicationSystemTestCase
  setup do
    @sesame_device = sesame_devices(:one)
  end

  test "visiting the index" do
    visit sesame_devices_url
    assert_selector "h1", text: "Sesame Devices"
  end

  test "creating a Sesame device" do
    visit sesame_devices_url
    click_on "New Sesame Device"

    fill_in "Device", with: @sesame_device.device_id
    fill_in "Nickname", with: @sesame_device.nickname
    fill_in "Organization", with: @sesame_device.organization_id
    fill_in "Serial", with: @sesame_device.serial
    click_on "Create Sesame device"

    assert_text "Sesame device was successfully created"
    click_on "Back"
  end

  test "updating a Sesame device" do
    visit sesame_devices_url
    click_on "Edit", match: :first

    fill_in "Device", with: @sesame_device.device_id
    fill_in "Nickname", with: @sesame_device.nickname
    fill_in "Organization", with: @sesame_device.organization_id
    fill_in "Serial", with: @sesame_device.serial
    click_on "Update Sesame device"

    assert_text "Sesame device was successfully updated"
    click_on "Back"
  end

  test "destroying a Sesame device" do
    visit sesame_devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sesame device was successfully destroyed"
  end
end
