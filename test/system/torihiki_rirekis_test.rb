require "application_system_test_case"

class TorihikiRirekisTest < ApplicationSystemTestCase
  setup do
    @torihiki_rireki = torihiki_rirekis(:one)
  end

  test "visiting the index" do
    visit torihiki_rirekis_url
    assert_selector "h1", text: "Torihiki rirekis"
  end

  test "should create torihiki rireki" do
    visit torihiki_rirekis_url
    click_on "New torihiki rireki"

    fill_in "Azukari", with: @torihiki_rireki.azukari
    fill_in "Code", with: @torihiki_rireki.code
    fill_in "Count", with: @torihiki_rireki.count
    fill_in "Kazei", with: @torihiki_rireki.kazei
    fill_in "Kigen", with: @torihiki_rireki.kigen
    fill_in "Kingaku", with: @torihiki_rireki.kingaku
    fill_in "Market", with: @torihiki_rireki.market
    fill_in "Meigara", with: @torihiki_rireki.meigara
    fill_in "Tanka", with: @torihiki_rireki.tanka
    fill_in "Tesuu", with: @torihiki_rireki.tesuu
    fill_in "Torihiki", with: @torihiki_rireki.torihiki
    fill_in "Ukewatasi", with: @torihiki_rireki.ukewatasi
    fill_in "Yakujobi", with: @torihiki_rireki.yakujobi
    fill_in "Zeigaku", with: @torihiki_rireki.zeigaku
    click_on "Create Torihiki rireki"

    assert_text "Torihiki rireki was successfully created"
    click_on "Back"
  end

  test "should update Torihiki rireki" do
    visit torihiki_rireki_url(@torihiki_rireki)
    click_on "Edit this torihiki rireki", match: :first

    fill_in "Azukari", with: @torihiki_rireki.azukari
    fill_in "Code", with: @torihiki_rireki.code
    fill_in "Count", with: @torihiki_rireki.count
    fill_in "Kazei", with: @torihiki_rireki.kazei
    fill_in "Kigen", with: @torihiki_rireki.kigen
    fill_in "Kingaku", with: @torihiki_rireki.kingaku
    fill_in "Market", with: @torihiki_rireki.market
    fill_in "Meigara", with: @torihiki_rireki.meigara
    fill_in "Tanka", with: @torihiki_rireki.tanka
    fill_in "Tesuu", with: @torihiki_rireki.tesuu
    fill_in "Torihiki", with: @torihiki_rireki.torihiki
    fill_in "Ukewatasi", with: @torihiki_rireki.ukewatasi
    fill_in "Yakujobi", with: @torihiki_rireki.yakujobi
    fill_in "Zeigaku", with: @torihiki_rireki.zeigaku
    click_on "Update Torihiki rireki"

    assert_text "Torihiki rireki was successfully updated"
    click_on "Back"
  end

  test "should destroy Torihiki rireki" do
    visit torihiki_rireki_url(@torihiki_rireki)
    click_on "Destroy this torihiki rireki", match: :first

    assert_text "Torihiki rireki was successfully destroyed"
  end
end
