class Staff < ActiveRecord::Base
  belongs_to :corporate

  has_secure_password
  
  validates :name, presence: true
  validates :user_name, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }
end
