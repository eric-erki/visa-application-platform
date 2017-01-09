require 'test_helper'

class ApplicantsControllerTest < ActionController::TestCase
  setup do
    @applicant = applicants(:one)
    @staff = staffs(:one)
    
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
  
  test "edit" do
    get :edit, id: @applicant.id
    assert_response :success
  end

  test "update name" do
#    post :update, applicant: {name: 'momoko', passport_number: 'E28100000', phone_number: '13800000000', mail_address: 'zuimeng1995@gmail.com'}, format: 'js'
#    assert_response :success
#    assert_equal 'momoko', Applicant.find(@applicnat.id).name
  end
  
  test "destroy" do
    applicant_size = Applicant.all.count
    post :destroy, id: @applicant.id
    assert_redirected_to applicants_path
    assert_equal applicant_size-1, Applicant.all.count
  end
end
