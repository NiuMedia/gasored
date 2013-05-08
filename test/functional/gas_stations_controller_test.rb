require 'test_helper'

class GasStationsControllerTest < ActionController::TestCase
  setup do
    @gas_station = gas_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gas_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gas_station" do
    assert_difference('GasStation.count') do
      post :create, gas_station: { direccion: @gas_station.direccion, foto1: @gas_station.foto1, foto2: @gas_station.foto2, foto3: @gas_station.foto3, latitud: @gas_station.latitud, longitud: @gas_station.longitud, nombre: @gas_station.nombre }
    end

    assert_redirected_to gas_station_path(assigns(:gas_station))
  end

  test "should show gas_station" do
    get :show, id: @gas_station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gas_station
    assert_response :success
  end

  test "should update gas_station" do
    put :update, id: @gas_station, gas_station: { direccion: @gas_station.direccion, foto1: @gas_station.foto1, foto2: @gas_station.foto2, foto3: @gas_station.foto3, latitud: @gas_station.latitud, longitud: @gas_station.longitud, nombre: @gas_station.nombre }
    assert_redirected_to gas_station_path(assigns(:gas_station))
  end

  test "should destroy gas_station" do
    assert_difference('GasStation.count', -1) do
      delete :destroy, id: @gas_station
    end

    assert_redirected_to gas_stations_path
  end
end
