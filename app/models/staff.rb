class Staff < ActiveRecord::Base
  belongs_to :corporate

  has_secure_password
  
  validates :name, presence: true
  validates :user_name, uniqueness: true, presence: true
  validate :valid_password_update, on: :update
  validate :valid_password_create, on: :create

  def valid_password_update
    if password.present?
      if password.length < 6
        errors.add(:password, 'is too short')
      end
    end
  end

  def valid_password_create
    if password.blank?
      errors.add(:password, "can't be blank")
    else
      errors.add(:password, 'is too short') if password.length < 6
    end
  end
end
