require 'test_helper'

class CorporateTest < ActiveSupport::TestCase
  setup do
    @applicant = applicants(:one)
    @staff = staffs(:one)
    @status = statuses(:one)
    @visa = visas(:one)
    @corporate = corporates(:one)
    @invalid_corporate = corporates(:two)
  end
  
  test 'check ownership' do
    assert @corporate.own?({:staff => @staff})
    assert @corporate.own?({:status => @status})
  end
end
