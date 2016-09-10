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

  def complete_status
    (1.0 * successful_process.index(current_status.status_code)) / successful_process.count
  end
  
  SUCCESSFUL_VISA =
    { 'JPN' => [
               [{'0' => '留学'}, Status::PROGRESS_NO_INTERVIEW_SUCCESS],
               [{'1' => '旅游'}, Status::PROGRESS_NO_INTERVIEW_SUCCESS],
               [{'2' => '探亲访友'}, Status::PROGRESS_NO_INTERVIEW_SUCCESS],
               [{'3' => '商务'}, Status::PROGRESS_NO_INTERVIEW_SUCCESS],
             ],
    }
end
