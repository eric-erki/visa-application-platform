# coding: utf-8
class Status < ActiveRecord::Base
  belongs_to :visa
  belongs_to :staff

  def status_name
    ALL_STATUSES[status_code]
  end

  def complete?
    status_code == (5 || 6) ? true : false
  end
  
  ALL_STATUSES = {
   0 => '待处理',
   1 => '材料审核中',
   2 => '已送签',
   3 => '待面试',
   4 => '使馆审核中',
   5 => '已出签',
   6 => '拒签'
  }

  #five steps in total
  PROGRESS_NO_INTERVIEW_SUCCESS = [0, 1, 2, 4, 5]
  PROGRESS_NO_INTERVIEW_FAILURE = [0, 1, 2, 4, 6]
  #six steps in total
  PROGRESS_WITH_INTERVIEW_SUCCESS = [0, 1, 2, 3, 4, 5]
  PROGRESS_WITH_INTERVIEW_FAILURE = [0, 1, 2, 3, 4, 6]
end
