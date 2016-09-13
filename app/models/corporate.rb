class Corporate < ActiveRecord::Base
  has_many :staffs

  #check if corporate is modifying his own resources
  def own?(options = {})
    if options[:applicant]
      applicant = options[:applicant]
      raise PageNotFoundError unless applicant.visas.first.statuses.first.staff.corporate_id == id
    elsif options[:visa]
      visa = options[:visa]
      raise PageNotFoundError unless visa.statuses.first.staff.corporate_id == id
    elsif options[:staff]
      staff = options[:staff]
      raise PageNotFoundError unless staff.corporate_id == id
    elsif options[:status]
      status = options[:status]
      raise PageNotFoundError unless status.staff.corporate_id == id
    end
  end
end
