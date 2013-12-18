require 'test_helper'

class MarcaVehiculosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marca_vehiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marca_vehiculo" do
    assert_difference('MarcaVehiculo.count') do
      post :create, :marca_vehiculo => { }
    end

    assert_redirected_to marca_vehiculo_path(assigns(:marca_vehiculo))
  end

  test "should show marca_vehiculo" do
    get :show, :id => marca_vehiculos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => marca_vehiculos(:one).to_param
    assert_response :success
  end

  test "should update marca_vehiculo" do
    put :update, :id => marca_vehiculos(:one).to_param, :marca_vehiculo => { }
    assert_redirected_to marca_vehiculo_path(assigns(:marca_vehiculo))
  end

  test "should destroy marca_vehiculo" do
    assert_difference('MarcaVehiculo.count', -1) do
      delete :destroy, :id => marca_vehiculos(:one).to_param
    end

    assert_redirected_to marca_vehiculos_path
  end
end
