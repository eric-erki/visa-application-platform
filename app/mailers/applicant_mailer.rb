class ApplicantMailer < ActionMailer::Base
  include Sidekiq::Mailer
  default from: 'zuimeng1995@gmail.com'

  def created(applicant, visa)
    @applicant = applicant
    @visa = visa
    mail(to: @applicant.mail_address, subject: 'You visa information is created!')
  end
end
