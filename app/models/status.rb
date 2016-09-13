# coding: utf-8
class Status < ActiveRecord::Base
  belongs_to :visa
  belongs_to :staff

  def status_name
    ALL_STATUSES[status_code]
  end

  def complete?
    (status_code == 5 || status_code == 6) ? true : false
  end

  def final_step?
    status_code == 4
  end
  
  ALL_STATUSES = {
   0 => 'pending',
   1 => 'checking documents',
   2 => 'application sent to administration',
   3 => 'wating for interview',
   4 => 'administration checking documents',
   5 => 'success',
   6 => 'reject'
  }

  #five steps in total
  PROGRESS_NO_INTERVIEW_SUCCESS = [0, 1, 2, 4, 5]
  PROGRESS_NO_INTERVIEW_FAILURE = [0, 1, 2, 4, 6]
  #six steps in total
  PROGRESS_WITH_INTERVIEW_SUCCESS = [0, 1, 2, 3, 4, 5]
  PROGRESS_WITH_INTERVIEW_FAILURE = [0, 1, 2, 3, 4, 6]
end
