require 'test_helper'

class RecitalsControllerTest < ActionController::TestCase
  setup do
    @recital = recitals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recitals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recital" do
    assert_difference('Recital.count') do
      post :create, recital: { content: @recital.content, image_path: @recital.image_path, title: @recital.title }
    end

    assert_redirected_to recital_path(assigns(:recital))
  end

  test "should show recital" do
    get :show, id: @recital
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recital
    assert_response :success
  end

  test "should update recital" do
    patch :update, id: @recital, recital: { content: @recital.content, image_path: @recital.image_path, title: @recital.title }
    assert_redirected_to recital_path(assigns(:recital))
  end

  test "should destroy recital" do
    assert_difference('Recital.count', -1) do
      delete :destroy, id: @recital
    end

    assert_redirected_to recitals_path
  end
end
