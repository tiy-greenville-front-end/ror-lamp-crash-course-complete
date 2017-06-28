require 'test_helper'

class LampsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lamp = lamps(:one)
  end

  test "should get index" do
    get lamps_url
    assert_response :success
  end

  test "should get new" do
    get new_lamp_url
    assert_response :success
  end

  test "should create lamp" do
    assert_difference('Lamp.count') do
      post lamps_url, params: { lamp: { state: @lamp.state } }
    end

    assert_redirected_to lamp_url(Lamp.last)
  end

  test "should show lamp" do
    get lamp_url(@lamp)
    assert_response :success
  end

  test "should get edit" do
    get edit_lamp_url(@lamp)
    assert_response :success
  end

  test "should update lamp" do
    patch lamp_url(@lamp), params: { lamp: { state: @lamp.state } }
    assert_redirected_to lamp_url(@lamp)
  end

  test "should destroy lamp" do
    assert_difference('Lamp.count', -1) do
      delete lamp_url(@lamp)
    end

    assert_redirected_to lamps_url
  end
end
