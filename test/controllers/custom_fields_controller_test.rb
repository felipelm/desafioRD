require 'test_helper'

class CustomFieldsControllerTest < ActionController::TestCase
  setup do
    @custom_field = custom_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_field" do
    assert_difference('CustomField.count') do
      post :create, custom_field: { custom_field_type: @custom_field.custom_field_type, default: @custom_field.default, description: @custom_field.description, name: @custom_field.name }
    end

    assert_redirected_to custom_field_path(assigns(:custom_field))
  end

  test "should show custom_field" do
    get :show, id: @custom_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_field
    assert_response :success
  end

  test "should update custom_field" do
    patch :update, id: @custom_field, custom_field: { custom_field_type: @custom_field.custom_field_type, default: @custom_field.default, description: @custom_field.description, name: @custom_field.name }
    assert_redirected_to custom_field_path(assigns(:custom_field))
  end

  test "should destroy custom_field" do
    assert_difference('CustomField.count', -1) do
      delete :destroy, id: @custom_field
    end

    assert_redirected_to custom_fields_path
  end
end
