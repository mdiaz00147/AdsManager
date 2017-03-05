require 'test_helper'

class AdsHitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ads_hit = ads_hits(:one)
  end

  test "should get index" do
    get ads_hits_url, as: :json
    assert_response :success
  end

  test "should create ads_hit" do
    assert_difference('AdsHit.count') do
      post ads_hits_url, params: { ads_hit: { ad_id: @ads_hit.ad_id, country_config_id: @ads_hit.country_config_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ads_hit" do
    get ads_hit_url(@ads_hit), as: :json
    assert_response :success
  end

  test "should update ads_hit" do
    patch ads_hit_url(@ads_hit), params: { ads_hit: { ad_id: @ads_hit.ad_id, country_config_id: @ads_hit.country_config_id } }, as: :json
    assert_response 200
  end

  test "should destroy ads_hit" do
    assert_difference('AdsHit.count', -1) do
      delete ads_hit_url(@ads_hit), as: :json
    end

    assert_response 204
  end
end
