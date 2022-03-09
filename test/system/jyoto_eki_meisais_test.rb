require "application_system_test_case"

class JyotoEkiMeisaisTest < ApplicationSystemTestCase
  setup do
    @jyoto_eki_meisai = jyoto_eki_meisais(:one)
  end

  test "visiting the index" do
    visit jyoto_eki_meisais_url
    assert_selector "h1", text: "Jyoto eki meisais"
  end

  test "should create jyoto eki meisai" do
    visit jyoto_eki_meisais_url
    click_on "New jyoto eki meisai"

    fill_in "Baikyaku", with: @jyoto_eki_meisai.baikyaku
    fill_in "Chiho", with: @jyoto_eki_meisai.chiho
    fill_in "Code", with: @jyoto_eki_meisai.code
    fill_in "Count", with: @jyoto_eki_meisai.count
    fill_in "Hiyo", with: @jyoto_eki_meisai.hiyo
    fill_in "Name", with: @jyoto_eki_meisai.name
    fill_in "Sinki gaku", with: @jyoto_eki_meisai.sinki_gaku
    fill_in "Son eki gaku", with: @jyoto_eki_meisai.son_eki_gaku
    fill_in "Syutoku bi", with: @jyoto_eki_meisai.syutoku_bi
    fill_in "Torihiki", with: @jyoto_eki_meisai.torihiki
    fill_in "Torikesi", with: @jyoto_eki_meisai.torikesi
    fill_in "Ukewatasi", with: @jyoto_eki_meisai.ukewatasi
    fill_in "Yakujo bi", with: @jyoto_eki_meisai.yakujo_bi
    click_on "Create Jyoto eki meisai"

    assert_text "Jyoto eki meisai was successfully created"
    click_on "Back"
  end

  test "should update Jyoto eki meisai" do
    visit jyoto_eki_meisai_url(@jyoto_eki_meisai)
    click_on "Edit this jyoto eki meisai", match: :first

    fill_in "Baikyaku", with: @jyoto_eki_meisai.baikyaku
    fill_in "Chiho", with: @jyoto_eki_meisai.chiho
    fill_in "Code", with: @jyoto_eki_meisai.code
    fill_in "Count", with: @jyoto_eki_meisai.count
    fill_in "Hiyo", with: @jyoto_eki_meisai.hiyo
    fill_in "Name", with: @jyoto_eki_meisai.name
    fill_in "Sinki gaku", with: @jyoto_eki_meisai.sinki_gaku
    fill_in "Son eki gaku", with: @jyoto_eki_meisai.son_eki_gaku
    fill_in "Syutoku bi", with: @jyoto_eki_meisai.syutoku_bi
    fill_in "Torihiki", with: @jyoto_eki_meisai.torihiki
    fill_in "Torikesi", with: @jyoto_eki_meisai.torikesi
    fill_in "Ukewatasi", with: @jyoto_eki_meisai.ukewatasi
    fill_in "Yakujo bi", with: @jyoto_eki_meisai.yakujo_bi
    click_on "Update Jyoto eki meisai"

    assert_text "Jyoto eki meisai was successfully updated"
    click_on "Back"
  end

  test "should destroy Jyoto eki meisai" do
    visit jyoto_eki_meisai_url(@jyoto_eki_meisai)
    click_on "Destroy this jyoto eki meisai", match: :first

    assert_text "Jyoto eki meisai was successfully destroyed"
  end
end
