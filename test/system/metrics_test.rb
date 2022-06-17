require "application_system_test_case"

class MetricsTest < ApplicationSystemTestCase
  setup do
    @metric = metrics(:one)
  end

  test "visiting the index" do
    visit metrics_url
    assert_selector "h1", text: "Metrics"
  end

  test "should create metric" do
    visit metrics_url
    click_on "New metric"

    fill_in "Kind", with: @metric.kind
    fill_in "Name", with: @metric.name
    fill_in "Project", with: @metric.project_id
    fill_in "Value", with: @metric.value
    click_on "Create Metric"

    assert_text "Metric was successfully created"
    click_on "Back"
  end

  test "should update Metric" do
    visit metric_url(@metric)
    click_on "Edit this metric", match: :first

    fill_in "Kind", with: @metric.kind
    fill_in "Name", with: @metric.name
    fill_in "Project", with: @metric.project_id
    fill_in "Value", with: @metric.value
    click_on "Update Metric"

    assert_text "Metric was successfully updated"
    click_on "Back"
  end

  test "should destroy Metric" do
    visit metric_url(@metric)
    click_on "Destroy this metric", match: :first

    assert_text "Metric was successfully destroyed"
  end
end
