require 'test_helper'

class FiltroVehiculosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filtro_vehiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filtro_vehiculo" do
    assert_difference('FiltroVehiculo.count') do
      post :create, :filtro_vehiculo => { }
    end

    assert_redirected_to filtro_vehiculo_path(assigns(:filtro_vehiculo))
  end

  test "should show filtro_vehiculo" do
    get :show, :id => filtro_vehiculos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => filtro_vehiculos(:one).to_param
    assert_response :success
  end

  test "should update filtro_vehiculo" do
    put :update, :id => filtro_vehiculos(:one).to_param, :filtro_vehiculo => { }
    assert_redirected_to filtro_vehiculo_path(assigns(:filtro_vehiculo))
  end

  test "should destroy filtro_vehiculo" do
    assert_difference('FiltroVehiculo.count', -1) do
      delete :destroy, :id => filtro_vehiculos(:one).to_param
    end

    assert_redirected_to filtro_vehiculos_path
  end
end
