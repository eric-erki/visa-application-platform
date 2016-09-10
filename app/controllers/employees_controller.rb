class EmployeesController < ApplicationController
  def login
    
  end

  def authenticate
    employee = Employee.find_by(user_name: params[:employee][:user_name].downcase)
    if employee && employee.authenticate(params[:employee][:password])
      log_in user
      params[:employee][:remember_me] == '1' ? remember() : forget(user)
    else
      flash.now[:danger] = 'Invalid username or password'
      redirect_to 'login'
    end
  end
end
