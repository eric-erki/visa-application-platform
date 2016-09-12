# coding: utf-8
class Visa < ActiveRecord::Base
  belongs_to :applicant
  has_many :statuses

  def successful_process
    SUCCESSFUL_VISA[country_abbr][visa_type][1]
  end

  def current_status
    statuses.order('created_at asc').last
  end

  def history_statuses
    statuses.order('created_at asc')
  end
  
  def complete_status
    (1.0 * successful_process.index(current_status.status_code)) / successful_process.count
  end

  def visa_type_name
    SUCCESSFUL_VISA[country_abbr][visa_type][0]
  end

  def self.available_countries
    SUCCESSFUL_VISA.map {|k,v| k}
  end

  def self.visa_types(country)
    SUCCESSFUL_VISA[country].map {|country_status| country_status[0]}
  end

  #visa will be automatically archived after 180 days completing whole process
  def archived?
    if current_status.complete? && (Time.now < (current_status.created_at + 180.days))
      true
    else
      false
    end
  end
  
  SUCCESSFUL_VISA =
    { 'JPN' => [
               ['Study', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
               ['Travel(single)', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
               ['Travel(5 years)', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
               ['Visiting Friends', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
               ['Business', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
             ],
    }
end
