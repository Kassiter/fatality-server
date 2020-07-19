require "application_system_test_case"

class PersonalFeaturesTest < ApplicationSystemTestCase
  setup do
    @personal_feature = personal_features(:one)
  end

  test "visiting the index" do
    visit personal_features_url
    assert_selector "h1", text: "Personal Features"
  end

  test "creating a Personal feature" do
    visit personal_features_url
    click_on "New Personal Feature"

    click_on "Create Personal feature"

    assert_text "Personal feature was successfully created"
    click_on "Back"
  end

  test "updating a Personal feature" do
    visit personal_features_url
    click_on "Edit", match: :first

    click_on "Update Personal feature"

    assert_text "Personal feature was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal feature" do
    visit personal_features_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal feature was successfully destroyed"
  end
end
