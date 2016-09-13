class Applicant < ActiveRecord::Base
  has_many :visas

  validates :phone_number, format: { with: /[0-9]|[+]/ }
  validates :phone_number, presence: true
  validates :passport_number, uniqueness: true
  validates :name, presence: true
  validates :mail_address, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, presence: true
end
