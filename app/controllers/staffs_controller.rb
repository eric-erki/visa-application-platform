class StaffsController < ApplicationController
  before_action :check_access_domain
  
  def index
    @staffs = current_staff.corporate.staffs
  end

  def new
  end

  def create
  end
  
  def edit
  end

  def update
    staff = Staff.find(params[:id])
    if params[:password]
      unless staff_params[:password] == staff_params[:password_confirmation]
        raise ActiveRecord::RecordInvalid, 'passport and passport confirmation are not the same'
      else
        staff.password_digest = BCrypt::Password.create(staff_params[:password], cost: 5)
      end
      staff.name = staff_params[:name]
      staff.save!
    end
  end

  def destroy
    staff = Staff.find(params[:id])
    staff.destroy
    redirect_to staffs_path
  end

  def staff_params
    params.require(:staff).permit(:password, :password_confirmation, :name, :user_name)
  end
end
