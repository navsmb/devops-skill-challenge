require 'test_helper'

class BooliosControllerTest < ActionController::TestCase
  setup do
    @boolio = boolios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boolios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boolio" do
    assert_difference('Boolio.count') do
      post :create, boolio: {  }
    end

    assert_redirected_to boolio_path(assigns(:boolio))
  end

  test "should show boolio" do
    get :show, id: @boolio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boolio
    assert_response :success
  end

  test "should update boolio" do
    patch :update, id: @boolio, boolio: {  }
    assert_redirected_to boolio_path(assigns(:boolio))
  end

  test "should destroy boolio" do
    assert_difference('Boolio.count', -1) do
      delete :destroy, id: @boolio
    end

    assert_redirected_to boolios_path
  end
end
