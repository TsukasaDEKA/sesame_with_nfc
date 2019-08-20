require "application_system_test_case"

class NfcCardsTest < ApplicationSystemTestCase
  setup do
    @nfc_card = nfc_cards(:one)
  end

  test "visiting the index" do
    visit nfc_cards_url
    assert_selector "h1", text: "Nfc Cards"
  end

  test "creating a Nfc card" do
    visit nfc_cards_url
    click_on "New Nfc Card"

    fill_in "Is activated", with: @nfc_card.is_activated
    fill_in "Name", with: @nfc_card.name
    fill_in "Password", with: @nfc_card.password
    fill_in "Uid", with: @nfc_card.uid
    fill_in "User", with: @nfc_card.user_id
    click_on "Create Nfc card"

    assert_text "Nfc card was successfully created"
    click_on "Back"
  end

  test "updating a Nfc card" do
    visit nfc_cards_url
    click_on "Edit", match: :first

    fill_in "Is activated", with: @nfc_card.is_activated
    fill_in "Name", with: @nfc_card.name
    fill_in "Password", with: @nfc_card.password
    fill_in "Uid", with: @nfc_card.uid
    fill_in "User", with: @nfc_card.user_id
    click_on "Update Nfc card"

    assert_text "Nfc card was successfully updated"
    click_on "Back"
  end

  test "destroying a Nfc card" do
    visit nfc_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nfc card was successfully destroyed"
  end
end
