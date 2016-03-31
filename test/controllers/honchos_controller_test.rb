require 'test_helper'

class HonchosControllerTest < ActionController::TestCase
  setup do
    @honcho = honchos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:honchos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create honcho" do
    assert_difference('Honcho.count') do
      post :create, honcho: { email: @honcho.email, links: @honcho.links, name: @honcho.name, notes: @honcho.notes, phone_number: @honcho.phone_number, position: @honcho.position }
    end

    assert_redirected_to honcho_path(assigns(:honcho))
  end

  test "should show honcho" do
    get :show, id: @honcho
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @honcho
    assert_response :success
  end

  test "should update honcho" do
    patch :update, id: @honcho, honcho: { email: @honcho.email, links: @honcho.links, name: @honcho.name, notes: @honcho.notes, phone_number: @honcho.phone_number, position: @honcho.position }
    assert_redirected_to honcho_path(assigns(:honcho))
  end

  test "should destroy honcho" do
    assert_difference('Honcho.count', -1) do
      delete :destroy, id: @honcho
    end

    assert_redirected_to honchos_path
  end
end
