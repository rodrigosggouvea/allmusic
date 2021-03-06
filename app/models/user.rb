class User < ActiveRecord::Base
  has_many :studios
	accepts_nested_attributes_for :studios

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user and user.password == password
      user    
    else
      false
    end
  end
end
