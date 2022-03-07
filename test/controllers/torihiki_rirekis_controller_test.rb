require "test_helper"

class TorihikiRirekisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @torihiki_rireki = torihiki_rirekis(:one)
  end

  test "should get index" do
    get torihiki_rirekis_url
    assert_response :success
  end

  test "should get new" do
    get new_torihiki_rireki_url
    assert_response :success
  end

  test "should create torihiki_rireki" do
    assert_difference("TorihikiRireki.count") do
      post torihiki_rirekis_url, params: { torihiki_rireki: { azukari: @torihiki_rireki.azukari, code: @torihiki_rireki.code, count: @torihiki_rireki.count, kazei: @torihiki_rireki.kazei, kigen: @torihiki_rireki.kigen, kingaku: @torihiki_rireki.kingaku, market: @torihiki_rireki.market, meigara: @torihiki_rireki.meigara, tanka: @torihiki_rireki.tanka, tesuu: @torihiki_rireki.tesuu, torihiki: @torihiki_rireki.torihiki, ukewatasi: @torihiki_rireki.ukewatasi, yakujobi: @torihiki_rireki.yakujobi, zeigaku: @torihiki_rireki.zeigaku } }
    end

    assert_redirected_to torihiki_rireki_url(TorihikiRireki.last)
  end

  test "should show torihiki_rireki" do
    get torihiki_rireki_url(@torihiki_rireki)
    assert_response :success
  end

  test "should get edit" do
    get edit_torihiki_rireki_url(@torihiki_rireki)
    assert_response :success
  end

  test "should update torihiki_rireki" do
    patch torihiki_rireki_url(@torihiki_rireki), params: { torihiki_rireki: { azukari: @torihiki_rireki.azukari, code: @torihiki_rireki.code, count: @torihiki_rireki.count, kazei: @torihiki_rireki.kazei, kigen: @torihiki_rireki.kigen, kingaku: @torihiki_rireki.kingaku, market: @torihiki_rireki.market, meigara: @torihiki_rireki.meigara, tanka: @torihiki_rireki.tanka, tesuu: @torihiki_rireki.tesuu, torihiki: @torihiki_rireki.torihiki, ukewatasi: @torihiki_rireki.ukewatasi, yakujobi: @torihiki_rireki.yakujobi, zeigaku: @torihiki_rireki.zeigaku } }
    assert_redirected_to torihiki_rireki_url(@torihiki_rireki)
  end

  test "should destroy torihiki_rireki" do
    assert_difference("TorihikiRireki.count", -1) do
      delete torihiki_rireki_url(@torihiki_rireki)
    end

    assert_redirected_to torihiki_rirekis_url
  end
end
