require "test_helper"

class JyotoEkiMeisaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jyoto_eki_meisai = jyoto_eki_meisais(:one)
  end

  test "should get index" do
    get jyoto_eki_meisais_url
    assert_response :success
  end

  test "should get new" do
    get new_jyoto_eki_meisai_url
    assert_response :success
  end

  test "should create jyoto_eki_meisai" do
    assert_difference("JyotoEkiMeisai.count") do
      post jyoto_eki_meisais_url, params: { jyoto_eki_meisai: { baikyaku: @jyoto_eki_meisai.baikyaku, chiho: @jyoto_eki_meisai.chiho, code: @jyoto_eki_meisai.code, count: @jyoto_eki_meisai.count, hiyo: @jyoto_eki_meisai.hiyo, name: @jyoto_eki_meisai.name, sinki_gaku: @jyoto_eki_meisai.sinki_gaku, son_eki_gaku: @jyoto_eki_meisai.son_eki_gaku, syutoku_bi: @jyoto_eki_meisai.syutoku_bi, torihiki: @jyoto_eki_meisai.torihiki, torikesi: @jyoto_eki_meisai.torikesi, ukewatasi: @jyoto_eki_meisai.ukewatasi, yakujo_bi: @jyoto_eki_meisai.yakujo_bi } }
    end

    assert_redirected_to jyoto_eki_meisai_url(JyotoEkiMeisai.last)
  end

  test "should show jyoto_eki_meisai" do
    get jyoto_eki_meisai_url(@jyoto_eki_meisai)
    assert_response :success
  end

  test "should get edit" do
    get edit_jyoto_eki_meisai_url(@jyoto_eki_meisai)
    assert_response :success
  end

  test "should update jyoto_eki_meisai" do
    patch jyoto_eki_meisai_url(@jyoto_eki_meisai), params: { jyoto_eki_meisai: { baikyaku: @jyoto_eki_meisai.baikyaku, chiho: @jyoto_eki_meisai.chiho, code: @jyoto_eki_meisai.code, count: @jyoto_eki_meisai.count, hiyo: @jyoto_eki_meisai.hiyo, name: @jyoto_eki_meisai.name, sinki_gaku: @jyoto_eki_meisai.sinki_gaku, son_eki_gaku: @jyoto_eki_meisai.son_eki_gaku, syutoku_bi: @jyoto_eki_meisai.syutoku_bi, torihiki: @jyoto_eki_meisai.torihiki, torikesi: @jyoto_eki_meisai.torikesi, ukewatasi: @jyoto_eki_meisai.ukewatasi, yakujo_bi: @jyoto_eki_meisai.yakujo_bi } }
    assert_redirected_to jyoto_eki_meisai_url(@jyoto_eki_meisai)
  end

  test "should destroy jyoto_eki_meisai" do
    assert_difference("JyotoEkiMeisai.count", -1) do
      delete jyoto_eki_meisai_url(@jyoto_eki_meisai)
    end

    assert_redirected_to jyoto_eki_meisais_url
  end
end
