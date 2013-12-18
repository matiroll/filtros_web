require 'test_helper'

class ImagensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imagens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imagen" do
    assert_difference('Imagen.count') do
      post :create, :imagen => { }
    end

    assert_redirected_to imagen_path(assigns(:imagen))
  end

  test "should show imagen" do
    get :show, :id => imagens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => imagens(:one).to_param
    assert_response :success
  end

  test "should update imagen" do
    put :update, :id => imagens(:one).to_param, :imagen => { }
    assert_redirected_to imagen_path(assigns(:imagen))
  end

  test "should destroy imagen" do
    assert_difference('Imagen.count', -1) do
      delete :destroy, :id => imagens(:one).to_param
    end

    assert_redirected_to imagens_path
  end
end
