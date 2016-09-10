class VisasController < ApplicationController
  def index
    
  end

  def search
    applicant = Applicant.where("name = ? and passport_number = ?", params[:name].upcase, params[:passport_number].upcase).first
    if applicant.present?
      @visas = applicant.visas
      logger.info @visas.inspect
    else
      @e = "No record found, check your name and passport number again"
    end
  end
end
