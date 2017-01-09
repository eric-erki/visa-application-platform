require 'test_helper'

class VisasControllerTest < ActionController::TestCase
  setup do
    @visa = visas(:one)
    @staff = staffs(:one)
    @corporate = corporates(:one)
    
    session[:staff_id] = @staff.id
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "shoule get index" do
    get :index
    assert_response :success
  end

  test "should get management" do
    get :management
    assert_response :success
    assert_equal Visa.all, assigns(:visas)
  end
  
  test "edit" do
#    get :edit, id: @visa.id
#    assert_response :success
  end

  test "destroy" do
#    post :destroy, id: @visa.id
#    assert_redirected_to "management"
  end
end
