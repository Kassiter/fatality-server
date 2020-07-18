require 'test_helper'

class PriviliegesFeaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @privilieges_feature = privilieges_features(:one)
  end

  test "should get index" do
    get privilieges_features_url
    assert_response :success
  end

  test "should get new" do
    get new_privilieges_feature_url
    assert_response :success
  end

  test "should create privilieges_feature" do
    assert_difference('PriviliegesFeature.count') do
      post privilieges_features_url, params: { privilieges_feature: {  } }
    end

    assert_redirected_to privilieges_feature_url(PriviliegesFeature.last)
  end

  test "should show privilieges_feature" do
    get privilieges_feature_url(@privilieges_feature)
    assert_response :success
  end

  test "should get edit" do
    get edit_privilieges_feature_url(@privilieges_feature)
    assert_response :success
  end

  test "should update privilieges_feature" do
    patch privilieges_feature_url(@privilieges_feature), params: { privilieges_feature: {  } }
    assert_redirected_to privilieges_feature_url(@privilieges_feature)
  end

  test "should destroy privilieges_feature" do
    assert_difference('PriviliegesFeature.count', -1) do
      delete privilieges_feature_url(@privilieges_feature)
    end

    assert_redirected_to privilieges_features_url
  end
end
