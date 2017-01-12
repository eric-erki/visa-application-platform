class Corporate < ActiveRecord::Base
  has_many :staffs

  #check if corporate is modifying his own resources
  def own?(options = {})
    if options[:applicant]
      applicant = options[:applicant]
      unless applicant.visas.first.statuses.first.staff.corporate_id == id
        logger.warn('access forbidden')
        raise PageNotFoundError
      end
    elsif options[:visa]
      visa = options[:visa]
      unless visa.statuses.first.staff.corporate_id == id
        logger.warn('access forbidden')
        raise PageNotFoundError
      end
    elsif options[:staff]
      staff = options[:staff]
      unless staff.corporate_id == id
        logger.warn('access forbidden')
        raise PageNotFoundError
      end
    elsif options[:status]
      status = options[:status]
      unless status.staff.corporate_id == id
        logger.warn('access forbidden')
        raise PageNotFoundError
      end
    end
    true
  end
end
