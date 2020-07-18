require "application_system_test_case"

class PriviliegesFeaturesTest < ApplicationSystemTestCase
  setup do
    @privilieges_feature = privilieges_features(:one)
  end

  test "visiting the index" do
    visit privilieges_features_url
    assert_selector "h1", text: "Privilieges Features"
  end

  test "creating a Privilieges feature" do
    visit privilieges_features_url
    click_on "New Privilieges Feature"

    click_on "Create Privilieges feature"

    assert_text "Privilieges feature was successfully created"
    click_on "Back"
  end

  test "updating a Privilieges feature" do
    visit privilieges_features_url
    click_on "Edit", match: :first

    click_on "Update Privilieges feature"

    assert_text "Privilieges feature was successfully updated"
    click_on "Back"
  end

  test "destroying a Privilieges feature" do
    visit privilieges_features_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Privilieges feature was successfully destroyed"
  end
end
