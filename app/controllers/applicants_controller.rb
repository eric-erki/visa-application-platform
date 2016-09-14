class ApplicantsController < ApplicationController
  before_action :check_access_domain

  
  def index
    @applicants = Applicant.all.order('created_at asc')
  end
  
  def new
  end

  def create
    applicant = Applicant.new(applicant_params)
    applicant.save!
    @m = "Created successfully!"
    render "applicants/bootbox.js.erb"
  end

  def edit
    @applicant = Applicant.find(params[:id])
  end

  def update
    applicant = Applicant.where('passport_number = ?', applicant_params[:passport_number]).last
    applicant.update_attributes!(applicant_params)
    @m = "Updated successfully!"
    render "applicants/bootbox.js.erb"
  end
    

  def destroy
    applicant = Applicant.find(params[:id])
    applicant.destroy
  end

  private
  def applicant_params
    params.require(:applicant).permit(:name, :passport_number, :phone_number, :mail_address)
  end
end
