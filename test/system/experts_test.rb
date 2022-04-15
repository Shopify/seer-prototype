require "application_system_test_case"

class ExpertsTest < ApplicationSystemTestCase
  setup do
    @expert = experts(:one)
  end

  test "visiting the index" do
    visit experts_url
    assert_selector "h1", text: "Experts"
  end

  test "should create expert" do
    visit experts_url
    click_on "New expert"

    fill_in "Name", with: @expert.name
    click_on "Create Expert"

    assert_text "Expert was successfully created"
    click_on "Back"
  end

  test "should update Expert" do
    visit expert_url(@expert)
    click_on "Edit this expert", match: :first

    fill_in "Name", with: @expert.name
    click_on "Update Expert"

    assert_text "Expert was successfully updated"
    click_on "Back"
  end

  test "should destroy Expert" do
    visit expert_url(@expert)
    click_on "Destroy this expert", match: :first

    assert_text "Expert was successfully destroyed"
  end
end
