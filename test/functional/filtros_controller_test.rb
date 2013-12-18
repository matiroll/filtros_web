require 'test_helper'

class FiltrosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filtros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filtro" do
    assert_difference('Filtro.count') do
      post :create, :filtro => { }
    end

    assert_redirected_to filtro_path(assigns(:filtro))
  end

  test "should show filtro" do
    get :show, :id => filtros(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => filtros(:one).to_param
    assert_response :success
  end

  test "should update filtro" do
    put :update, :id => filtros(:one).to_param, :filtro => { }
    assert_redirected_to filtro_path(assigns(:filtro))
  end

  test "should destroy filtro" do
    assert_difference('Filtro.count', -1) do
      delete :destroy, :id => filtros(:one).to_param
    end

    assert_redirected_to filtros_path
  end
end
