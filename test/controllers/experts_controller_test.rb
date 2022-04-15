require "test_helper"

class ExpertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expert = experts(:one)
  end

  test "should get index" do
    get experts_url
    assert_response :success
  end

  test "should get new" do
    get new_expert_url
    assert_response :success
  end

  test "should create expert" do
    assert_difference("Expert.count") do
      post experts_url, params: { expert: { name: @expert.name } }
    end

    assert_redirected_to expert_url(Expert.last)
  end

  test "should show expert" do
    get expert_url(@expert)
    assert_response :success
  end

  test "should get edit" do
    get edit_expert_url(@expert)
    assert_response :success
  end

  test "should update expert" do
    patch expert_url(@expert), params: { expert: { name: @expert.name } }
    assert_redirected_to expert_url(@expert)
  end

  test "should destroy expert" do
    assert_difference("Expert.count", -1) do
      delete expert_url(@expert)
    end

    assert_redirected_to experts_url
  end
end
