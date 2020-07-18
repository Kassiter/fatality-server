require 'test_helper'

class PriviliegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @priviliege = privilieges(:one)
  end

  test "should get index" do
    get privilieges_url
    assert_response :success
  end

  test "should get new" do
    get new_priviliege_url
    assert_response :success
  end

  test "should create priviliege" do
    assert_difference('Priviliege.count') do
      post privilieges_url, params: { priviliege: {  } }
    end

    assert_redirected_to priviliege_url(Priviliege.last)
  end

  test "should show priviliege" do
    get priviliege_url(@priviliege)
    assert_response :success
  end

  test "should get edit" do
    get edit_priviliege_url(@priviliege)
    assert_response :success
  end

  test "should update priviliege" do
    patch priviliege_url(@priviliege), params: { priviliege: {  } }
    assert_redirected_to priviliege_url(@priviliege)
  end

  test "should destroy priviliege" do
    assert_difference('Priviliege.count', -1) do
      delete priviliege_url(@priviliege)
    end

    assert_redirected_to privilieges_url
  end
end
