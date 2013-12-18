require 'test_helper'

class EquivalenciasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equivalencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equivalencia" do
    assert_difference('Equivalencia.count') do
      post :create, :equivalencia => { }
    end

    assert_redirected_to equivalencia_path(assigns(:equivalencia))
  end

  test "should show equivalencia" do
    get :show, :id => equivalencias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => equivalencias(:one).to_param
    assert_response :success
  end

  test "should update equivalencia" do
    put :update, :id => equivalencias(:one).to_param, :equivalencia => { }
    assert_redirected_to equivalencia_path(assigns(:equivalencia))
  end

  test "should destroy equivalencia" do
    assert_difference('Equivalencia.count', -1) do
      delete :destroy, :id => equivalencias(:one).to_param
    end

    assert_redirected_to equivalencias_path
  end
end
