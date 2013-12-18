require 'test_helper'

class VehiculosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehiculo" do
    assert_difference('Vehiculo.count') do
      post :create, :vehiculo => { }
    end

    assert_redirected_to vehiculo_path(assigns(:vehiculo))
  end

  test "should show vehiculo" do
    get :show, :id => vehiculos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vehiculos(:one).to_param
    assert_response :success
  end

  test "should update vehiculo" do
    put :update, :id => vehiculos(:one).to_param, :vehiculo => { }
    assert_redirected_to vehiculo_path(assigns(:vehiculo))
  end

  test "should destroy vehiculo" do
    assert_difference('Vehiculo.count', -1) do
      delete :destroy, :id => vehiculos(:one).to_param
    end

    assert_redirected_to vehiculos_path
  end
end
