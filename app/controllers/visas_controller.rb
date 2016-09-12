class VisasController < ApplicationController
  def index
  end

  def search
    applicant = Applicant.where("name = ? and passport_number = ?", params[:name].upcase, params[:passport_number].upcase).first
    if applicant.present?
      @visas = applicant.visas
    else
      @e = "No record found, check your name and passport number again"
    end
  end

  def management
  end

  def new
    @visa_country_type = Visa::SUCCESSFUL_VISA
  end

  def create
  end

  def set_visa_type_options
    country = params[:country]
    types = Visa.visa_types(country)
    @type_options = []
    for i in 0...types.count
      @type_options[i] = [types[i], i]
    end
  end

  def visa_params
    params.permit(:name, :passport_number, :phone_number, :mail_address, :country_abbr, :type)
  end
end
