require 'test_helper'

class VisaTest < ActiveSupport::TestCase
  setup do
    @visa = visas(:one)
    @status = statuses(:four)
  end
  
  test 'get applying process assuming it will be successful' do
    assert_equal [0, 1, 2, 4, 5],  @visa.successful_process
  end

  test 'current process' do
    assert_equal @status, @visa.current_status
  end

  test 'visa_type_name' do
    assert_equal "Study", @visa.visa_type_name
  end

  test 'available countries' do
    assert_equal ["JPN", "USA", "DEU", "FRA"], Visa.available_countries
  end

  test 'visa types' do
    assert_equal ["Study", "Travel(single)", "Travel(group)", "Travel(5 years)", "Visiting Friends", "Business", "Working"],  Visa.visa_types('JPN')
  end

end
