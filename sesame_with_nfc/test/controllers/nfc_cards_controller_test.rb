require 'test_helper'

class NfcCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nfc_card = nfc_cards(:one)
  end

  test "should get index" do
    get nfc_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_nfc_card_url
    assert_response :success
  end

  test "should create nfc_card" do
    assert_difference('NfcCard.count') do
      post nfc_cards_url, params: { nfc_card: { is_activated: @nfc_card.is_activated, name: @nfc_card.name, password: @nfc_card.password, uid: @nfc_card.uid, user_id: @nfc_card.user_id } }
    end

    assert_redirected_to nfc_card_url(NfcCard.last)
  end

  test "should show nfc_card" do
    get nfc_card_url(@nfc_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_nfc_card_url(@nfc_card)
    assert_response :success
  end

  test "should update nfc_card" do
    patch nfc_card_url(@nfc_card), params: { nfc_card: { is_activated: @nfc_card.is_activated, name: @nfc_card.name, password: @nfc_card.password, uid: @nfc_card.uid, user_id: @nfc_card.user_id } }
    assert_redirected_to nfc_card_url(@nfc_card)
  end

  test "should destroy nfc_card" do
    assert_difference('NfcCard.count', -1) do
      delete nfc_card_url(@nfc_card)
    end

    assert_redirected_to nfc_cards_url
  end
end
