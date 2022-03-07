require "application_system_test_case"

class KigyoMastersTest < ApplicationSystemTestCase
  setup do
    @kigyo_master = kigyo_masters(:one)
  end

  test "visiting the index" do
    visit kigyo_masters_url
    assert_selector "h1", text: "Kigyo masters"
  end

  test "should create kigyo master" do
    visit kigyo_masters_url
    click_on "New kigyo master"

    fill_in "Code", with: @kigyo_master.code
    fill_in "Kind", with: @kigyo_master.kind
    fill_in "Market", with: @kigyo_master.market
    fill_in "Name", with: @kigyo_master.name
    click_on "Create Kigyo master"

    assert_text "Kigyo master was successfully created"
    click_on "Back"
  end

  test "should update Kigyo master" do
    visit kigyo_master_url(@kigyo_master)
    click_on "Edit this kigyo master", match: :first

    fill_in "Code", with: @kigyo_master.code
    fill_in "Kind", with: @kigyo_master.kind
    fill_in "Market", with: @kigyo_master.market
    fill_in "Name", with: @kigyo_master.name
    click_on "Update Kigyo master"

    assert_text "Kigyo master was successfully updated"
    click_on "Back"
  end

  test "should destroy Kigyo master" do
    visit kigyo_master_url(@kigyo_master)
    click_on "Destroy this kigyo master", match: :first

    assert_text "Kigyo master was successfully destroyed"
  end
end
