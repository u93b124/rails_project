require "test_helper"

class KigyoMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kigyo_master = kigyo_masters(:one)
  end

  test "should get index" do
    get kigyo_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_kigyo_master_url
    assert_response :success
  end

  test "should create kigyo_master" do
    assert_difference("KigyoMaster.count") do
      post kigyo_masters_url, params: { kigyo_master: { code: @kigyo_master.code, kind: @kigyo_master.kind, market: @kigyo_master.market, name: @kigyo_master.name } }
    end

    assert_redirected_to kigyo_master_url(KigyoMaster.last)
  end

  test "should show kigyo_master" do
    get kigyo_master_url(@kigyo_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_kigyo_master_url(@kigyo_master)
    assert_response :success
  end

  test "should update kigyo_master" do
    patch kigyo_master_url(@kigyo_master), params: { kigyo_master: { code: @kigyo_master.code, kind: @kigyo_master.kind, market: @kigyo_master.market, name: @kigyo_master.name } }
    assert_redirected_to kigyo_master_url(@kigyo_master)
  end

  test "should destroy kigyo_master" do
    assert_difference("KigyoMaster.count", -1) do
      delete kigyo_master_url(@kigyo_master)
    end

    assert_redirected_to kigyo_masters_url
  end
end
