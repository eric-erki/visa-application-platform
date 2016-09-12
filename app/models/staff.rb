class Staff < ActiveRecord::Base
  belongs_to :corporate

  has_secure_password

end
