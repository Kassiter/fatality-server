require "application_system_test_case"

class PriviliegesTest < ApplicationSystemTestCase
  setup do
    @priviliege = privilieges(:one)
  end

  test "visiting the index" do
    visit privilieges_url
    assert_selector "h1", text: "Privilieges"
  end

  test "creating a Priviliege" do
    visit privilieges_url
    click_on "New Priviliege"

    click_on "Create Priviliege"

    assert_text "Priviliege was successfully created"
    click_on "Back"
  end

  test "updating a Priviliege" do
    visit privilieges_url
    click_on "Edit", match: :first

    click_on "Update Priviliege"

    assert_text "Priviliege was successfully updated"
    click_on "Back"
  end

  test "destroying a Priviliege" do
    visit privilieges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Priviliege was successfully destroyed"
  end
end
