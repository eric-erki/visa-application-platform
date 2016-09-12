require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  fixtures :statuses
  
  def test_complete
    status = statuses(:one)
    assert !status.complete?
  end
end
