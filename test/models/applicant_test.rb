require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  fixtures 'applicants'
  
  setup do
    @applicant = applicants(:one)
  end
  
  test 'validation of phone numer' do
    @applicant.phone_number = '090^44582245'
    assert_not @applicant.save
  end

  test 'validation of mail address' do
    @applicant.mail_address = 'zuimeng1995@gmail'
    assert_not @applicant.save
  end

end
