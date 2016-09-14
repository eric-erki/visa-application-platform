class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from(ActiveRecord::RecordInvalid) {|e| @e = e.record.errors.full_messages.join("<br>"); render 'shared/bootbox.js.erb' }
  rescue_from(PageNotFoundError, with: :error_404)
  rescue_from(ActiveRecord::RecordNotFound, with: :error_404)
  
  private
  def current_staff
    @current_staff ||= Staff.find(session[:staff_id]) if session[:staff_id]
  end

  helper_method :current_staff

  def error_404
    send_file "public/404.html" , :type => "text/html; charset=utf-8", :disposition => 'inline', :status => :not_found
  end
  
  #check if staff access corresponds to his domain
  def check_access_domain
    if current_staff.nil?
      flash[:notice] = 'Sign in first'
      redirect_to new_session_path
    elsif ! AccessDomain.domain_ok?(current_staff.domain, params[:controller], params[:action])
      logger.warn('DOMAIN NG')
      raise PageNotFoundError
    end
  end
end
