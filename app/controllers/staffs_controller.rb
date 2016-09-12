class StaffsController < ApplicationController
  def index
    @staffs = current_staff.corporate.staffs
  end
  
  def edit
  end

  def update
  end

  def destroy
    staff = Staff.find(params[:id])
    staff.destroy
    redirect_to staffs_path
  end
end
