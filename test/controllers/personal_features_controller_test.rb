require 'test_helper'

class PersonalFeaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_feature = personal_features(:one)
  end

  test "should get index" do
    get personal_features_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_feature_url
    assert_response :success
  end

  test "should create personal_feature" do
    assert_difference('PersonalFeature.count') do
      post personal_features_url, params: { personal_feature: {  } }
    end

    assert_redirected_to personal_feature_url(PersonalFeature.last)
  end

  test "should show personal_feature" do
    get personal_feature_url(@personal_feature)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_feature_url(@personal_feature)
    assert_response :success
  end

  test "should update personal_feature" do
    patch personal_feature_url(@personal_feature), params: { personal_feature: {  } }
    assert_redirected_to personal_feature_url(@personal_feature)
  end

  test "should destroy personal_feature" do
    assert_difference('PersonalFeature.count', -1) do
      delete personal_feature_url(@personal_feature)
    end

    assert_redirected_to personal_features_url
  end
end
