require 'test_helper'

class CustomFieldValuesControllerTest < ActionController::TestCase
  setup do
    @custom_field_value = custom_field_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_field_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_field_value" do
    assert_difference('CustomFieldValue.count') do
      post :create, custom_field_value: { contact_id: @custom_field_value.contact_id, custom_field_id: @custom_field_value.custom_field_id, value: @custom_field_value.value }
    end

    assert_redirected_to custom_field_value_path(assigns(:custom_field_value))
  end

  test "should show custom_field_value" do
    get :show, id: @custom_field_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_field_value
    assert_response :success
  end

  test "should update custom_field_value" do
    patch :update, id: @custom_field_value, custom_field_value: { contact_id: @custom_field_value.contact_id, custom_field_id: @custom_field_value.custom_field_id, value: @custom_field_value.value }
    assert_redirected_to custom_field_value_path(assigns(:custom_field_value))
  end

  test "should destroy custom_field_value" do
    assert_difference('CustomFieldValue.count', -1) do
      delete :destroy, id: @custom_field_value
    end

    assert_redirected_to custom_field_values_path
  end
end
