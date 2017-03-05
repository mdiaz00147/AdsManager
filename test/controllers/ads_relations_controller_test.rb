require 'test_helper'

class AdsRelationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ads_relation = ads_relations(:one)
  end

  test "should get index" do
    get ads_relations_url, as: :json
    assert_response :success
  end

  test "should create ads_relation" do
    assert_difference('AdsRelation.count') do
      post ads_relations_url, params: { ads_relation: { ad_id: @ads_relation.ad_id, country_config_id: @ads_relation.country_config_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ads_relation" do
    get ads_relation_url(@ads_relation), as: :json
    assert_response :success
  end

  test "should update ads_relation" do
    patch ads_relation_url(@ads_relation), params: { ads_relation: { ad_id: @ads_relation.ad_id, country_config_id: @ads_relation.country_config_id } }, as: :json
    assert_response 200
  end

  test "should destroy ads_relation" do
    assert_difference('AdsRelation.count', -1) do
      delete ads_relation_url(@ads_relation), as: :json
    end

    assert_response 204
  end
end
