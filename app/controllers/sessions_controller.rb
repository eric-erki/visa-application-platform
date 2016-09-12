class SessionsController < ApplicationController
  def new
  end

  def create
    staff = Staff.find_by_user_name(params[:user_name])
    if staff and staff.authenticate(params[:password])
      session[:staff_id] = staff.id
      redirect_to controller: 'visas', action: 'management'
    else
      flash[:notice] = 'username or password is invalid'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:staff_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to new_session_path
  end
end
