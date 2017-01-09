require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @applicant = applicants(:one)
    @message = messages(:one)
    @staff = staffs(:one)

   session[:staff_id] = @staff.id
  end
  
  test "should get new" do
    get :new, applicant: @applicant.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "create" do
    messages_size = Message.all.count
    post :create, messages: {applicant_id: 0, content: 'This applicaiton is cool', alreay_read: 0}
    assert_response :success
    assert_equal messages_size+1, Message.all.count
  end

  test "update" do
    post :update, id: @message.id, format: 'js'
    assert_response :success
    assert_equal 1, Message.all.first.already_read
  end
end
